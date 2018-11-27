# Scripts

We find that the closest they are to the machine, the better we can compose our tools. Therefore, we usually install binaries from well-known open source initiatives and we build Bash (Linux) scripts to wrap and to chain them.

Why Bash? It is exceptionally well documented and it is available natively on all major platforms: Linux and macOS, and now Windows as well if you install the [Windows Subsystem for Linux][MSWSL].

For tasks where Bash is ill-suited, we have been using another language. In our case, this is PHP but you should definitely keep your favorite.

There are going to be several categories of scripts: the launchers, the compressors, the encoders and the one that validates the improved files.

## Setting up

_Disclaimer: this chapter is **not** a complete server setup, and definitely not a security best-practices guide. This is not even a minimum viable production setup. We will merely give some performance pointers._


### Using a temporary virtual machine for the tests

Testing with VirtualBox: Make sure the network card is configured as “Virtual private host”. This will add an IP to your local machine on the same subnet as what VirtualBox uses (for example 192.168.56.0), so you will be able to call the virtual machine from your own machine.

You should also allow SSH from the virtual machine’s terminal in the following file:
```bash
vi /etc/ssh/sshd_config
```

Find the PermitRootLogin option, uncomment it if necessary and set its value to “yes”:
```cfg
PermitRootLogin	yes
```

Save and close the file, then run `service ssh reload`.
Finally, install the `net-tools` package so we can find out the VM’s IP address:
```bash
apt-get update && apt-get upgrade && apt-get install net-tools && ifconfig
```

You can now run ssh into your virtual machine from your own machine (change the IP below by the one that was given by ifconfig above):
```bash
ssh root@192.168.56.101
```


### Server performance tips

#### Use the RAM to store temporary and cache files

_Disclaimer: this is actually a production-ready tip, but do experiment first._

We are going to write a lot of temporary files to disk. To improve performance for this kind of input-output (i/o), we are going to use a RAMdisk instead of the actual hard drive or SSD. This way, the server will write the many temporary PNG and JPEG files to RAM and it will be a lot faster. You can check the busy state of your disks with the `atop` tool.

For those who need convincing beforehand, you could test the speed at which your system can write files. Using an 1.5 G file as an example, copying it to an SSD takes up to ~20s on our system; on the other hand, copying the same file to a RAMDisk takes ~1s.

This tip won’t help speeding up the actual encoding of the images, because that typically requires CPU time this tip doesn’t address. The encoding can sometimes be parallelized over several CPU, and some tools have options for that (see “threading”), but in that case you would need more RAM and/or CPU cores to handle the same tasks, and that’s not in the scope for this article. Just remember that each tool’s contributors are aware of their program’s CPU and RAM usage and they are doing their best to make them as efficient as possible.

The RAMdisk tip is very useful if your drives are SSD, because writes wear them down and we are going to do a lot of writes. It is also going to be just as useful for hard disk drives because they are very slow with writes, while RAM is fast. Either way, it’s a win.

Since we want to refrain from using the `root` user for everything, we create a user that we will call “**ilsa**” from now on. All tasks will be run by that user, and the temporary folder will be theirs too.
```bash
su ilsa
mkdir /home/ilsa/tmp
```

Now add something like this to the `/etc/fstab` file:
```
tmpfs   /home/ilsa/tmp   tmpfs   nodev,nosuid,noexec,nodiratime,noatime,size=8G   0 0
```

Beware the “8G” in this example, it’s the amount of space that this mount point will be allowed to grow to. Use a low number and your encoding scripts will fail; use a number too high and you will deplete your RAM. Don’t use any of this verbatim, but read the docs and adapt to your use case.

Now run `sudo mount -a` to apply the changes and `df -h` to check them:
```
Filesystem      Size  Used Avail Use% Mounted on
[...]
tmpfs           8.0G     0  8.0G   0% /home/ilsa/tmp
```

If you have a write-heavy tool at hand, you can run atop in a console and watch as it behaves differently when you use the disk or the new mount point.

Don’t forget to periodically clean up the new directory, or you will fill the space really fast. This can be done with a crontab, here’s an example:
```bash
* * * * * /usr/bin/find /home/ilsa/tmp -ignore_readdir_race -mmin +15 \! -type d -delete
```
(delete all non-directory files written at least 15 minutes ago)


#### Use a functional approach for scripts

As programmers, some of us are used to create lists we can iterate over. With Bash and especially when handling files, this is not always the best approach. Bash can do enumerations and loops, but it can also chain commands, the output from one becoming the input to the next (with very efficient streams between them). Or at least, you should try to loop over streams rather than strings and lists.

In this, Bash is closer to SQL than to imperative languages.


### A word on “find”

You may find that this tool is very powerful. It allows for criteria to locate files on the filesystem, so we are going to use it a lot.

One nice bonus with `find` is its `action` parameter, which you can set to `print` while you are testing your filters and then change to `delete` once you are ready, or you can use `exec` and have it run another command with parameters you specify.

Here’s how to find old temporary files and do something with them:
```bash
find /home/ilsa/tmp -ignore_readdir_race -mmin +15 \! -type d -print
find /home/ilsa/tmp -ignore_readdir_race -mmin +15 \! -type d -delete
find /home/ilsa/tmp -ignore_readdir_race -mmin +15 \! -type d -exec ls -alh '{}' \;
```

Other examples are:

Non-directory files that were written at least 5 days ago, in absolute days
```bash
find /home/ilsa/tmp -daystart -mtime +5 \! -type d -print
```

Retina-ready JPEG files
```bash
find /home/ilsa/tmp -name '*@2x.jpg*' -print
```

Empty files with a recompressed suffix
```bash
find /home/ilsa/tmp \
  -regextype posix-egrep -regex '.+\.(gz|br|lzma|webp|jp2|jxr)$' \
  -size 0 \
  -print
```

Pass GZ and Brotli filenames to a custom script with a command-line parameter of “2”
```bash
find /home/ilsa/tmp
  -regextype posix-egrep -regex '.+\.(gz|br)$' \
  -exec /home/ilsa/scripts/obsolete-alts.sh 2 '{}' \;
```

Or if you dislike this syntax, you can use the `print` action and pipe `find`’s output to the other program
```bash
find /home/ilsa/tmp -regextype posix-egrep -regex '.+\.(gz|br)$' -print \
  | /home/ilsa/scripts/obsolete-alts.sh 2
```


### Installing the binaries

You can choose to install them from any package manager of your choice, or you can build them from source. We won’t go into the details of installing each here.

Here are the dependencies we are going to review:

[Brotli]
Installed as: `/usr/local/sbin/brotli`

[LZMA] (for Safari, rendered obsolete by [Brotli][caniuse-br])
Installed as: `/usr/local/bin/lzma`

[JPEG-XR] (for Edge, rendered obsolete by [WebP][caniuse-webp])
Installed as: `/usr/local/bin/JxrEncApp`
Sometimes, it is already installed with the system. Use `which JxrEncApp` to find out if this is the case.

[Zopfli] (supported by all browsers)
Installed as: `/usr/local/sbin/zopfli`

[WebP] (for the longest time it was supported only by Chrome, now also Edge and Firefox)
Installed as: `/usr/local/bin/cwebp`, `/usr/local/bin/gif2webp`

[ImageMagick]
Installed as: `/usr/local/bin/magick`

[JPEG-2000] from OpenJPEG
Installed as: `/usr/local/bin/opj_compress`

[Guetzli]
Installed as: `/usr/local/bin/guetzli`

[Butteraugli]
Installed as: `/usr/local/bin/compare_pngs`

There are many other tools (notably **ImageOptim**), as this space is evolving fast. We haven’t tried them all. Some names appeared recently. We aren’t a CDN, we are just trying to provide a decent website for our customers. There is a point after which more engineering work won’t help with the bottom line.


### About the perceptual difference with image encoding

There are several ways to compute the perceived difference of two images, mostly to ascertain which of two compression ratio looks best to the human eye. Butteraugli is one of them and it calls this “psychovisual difference”.

There are several tools around the same issue and we will try to give an overview of how they differ.

Butteraugli: compare two existing versions of the same PNG image
It won’t work on images that are essentially different, and it will also complain if the dimensions are different. It is intended to identify the best compression ratio for one image, by iterating over multiple compression settings.
Be aware that it is not immediate; it may take several dozen seconds for the analysis to complete.

Guetzli: a JPEG compressor
To best use this tool, you have to know in advance the best JPEG quality setting for your use case or let the default. Guetzli won’t find the best quality setting for you, but rather the best image for the quality setting you are targeting. It works by applying several quantization techniques (that’s one of the stages to encode a JPEG) for one quality setting and applying butteraugli’s techniques to compare the results so as to produce only the image with the best score.
Be aware that it is very **slow** (several minutes for each file).


### Composing the toolchain

As stated before, Linux and Bash are very efficient at chaining commands. The buffer works well to parallelise commands up to a point, but we are talking about binary files here. We shouldn’t pass around so this type of content between scripts, mostly because Linux pipes are made for text, which means they are used to split input by using the newline characters, and that doesn’t work well with binary content. Therefore, when chaining compression tasks, we will pass around file names rather than their contents.

The easiest way to batch-process images is to echo lists of filenames to the standard output that we pipe into the next script, which in turn echoes the filenames so they can be piped further. This way, we gain a measure of parallelism for free thanks to the very efficient streaming of the pipes (the calling script will pause when its buffer is full, and resume when it gets free).

To that end, we will need a small Bash wrapper for each tool so we can standardize their usage. We will call our wrappers brotlify.sh, zopflify.sh, webpfy.sh, jp2fy.sh etc.

Here is an example of the proposed toolchain:
```bash
find /path/to/images [options] -print | webpfy.sh | jp2fy.sh
find /path/to/assets [options] -print | gzipfy.sh | brotlify.sh | zopflify.sh
```

Each wrapper will have the same logic:
1. try to create an optimized file in a temporary location;
1. keep the new file only if its size is smaller than the original;
1. if a file is already present where the optimisation was going to be placed, compare their hash before renaming the file;
1. if everything checks out, update the new file metadata from the original and place the new file at the final location.

Individually, some wrappers will require additional steps. For example, the JP2 converter only accepts PNG files as input, which means that for non-PNG files we will need to convert them on the fly.

We could make each tool echo only the filenames it processed but that would break the chain, so instead we will have each wrapper echo all the filenames it sees.


### About temporary files

To perform our optimisations, we need to create alternate compressed files for each of the files that need to be published. On average, we will try 4 encoders per image and 3 encoders per text file, without knowing in advance if any of the resulting files will be good enough to keep.

If we create a JP2 that is bigger than say the JPEG it came from, we don’t want that file to reach our users. We need to be ready to drop the JP2 file without it ever reaching the final location on the disk. We don’t want to disturb the final files on disk unless they need to be changed.

This means we need a way to create temporary process files so that they don’t disturb the final filenames until they are validated.

It looks like this:
1. Create the compressed version of a file at a temporary location;
1. Compare its file size with the file it was created from, and drop it if too big;
1. Place the alternate compressed file at its final location, with metadata already set.


### Wrappers

For ease of use and ease of chaining, every compression format will have its own wrapper script.

The most simple wrapper could look like this:
```bash
#!/usr/bin/env bash
{
COMMIT_BIN="/usr/local/bin/commit-file.sh"
WEBP_BIN="/usr/local/bin/cwebp"
WEBP_OPTS="-alpha_cleanup -quiet -m 6 -q 90 -sharpness 0 -metadata none -mt"
EXT="webp"
TMP_PATH="/path/to/tmp"

while read SRC_FILENAME
do
  if [ -s "$SRC_FILENAME" ]
  then
    echo "$SRC_FILENAME"

    TMPFILE=$(mktemp $TMP_PATH/XXXXXX.$EXT)
    $WEBP_BIN $WEBP_OPTS "$SRC_FILENAME" -o "$TMPFILE"

    $COMMIT_BIN "$SRC_FILENAME" "$TMPFILE" "$SRC_FILENAME.$EXT"
    rm $TMPFILE
  fi
done

exit
}
```

Here is a walkthrough:
The curly braces and the `exit` keyword enclosing the script are there to make sure that if we update the script while it is running, the current run won’t break unexpectedly. Indeed, if you modify a script while it is running, your modifications will be taken into account by the already-started process. Say you add a block of code at line 18 while it was already running at line 20: when it reaches the end of that line, it will read line 21 which is not what it was when it started, and hopefully it will cause a syntax error, or in the worst case it won’t immediately fail but start running code that was not meant to be run. So, depending on the modifications, it may be very bad. Curly braces avoid that by forcing Bash to read the whole program in memory as soon as the script starts.

First we set a few variables. Then we loop over the standard input, which means every line piped to this script will cause one iteration of the loop to be read into the `$SRC_FILENAME` variable.

The second action is to encode the original file with WebP at the temporary location, and finally we call the common “commit” script which will check a few things (permissions, file size, timestamps etc.) before copying the temporary file to its final location. This line is where we check that the new file has a lower file size than the original and then does basically a `cp` command that makes sure all attributes are copied from the original file to the final file, whatever the attributes of the temporary file.

For the target filename, the naming convention we came up with was to simply add a suffix to the original filename.


### The launcher script

Here is a proposed launcher script, suitable for a cronjob that could run every minute:

```bash
#!/usr/bin/env bash
{
EMAIL="admin@example.com"
FIND_GIFS="-regextype posix-egrep -regex '.+\.gif'"
FIND_IMGS="-regextype posix-egrep -regex '.+\.(jpg|png)'"
FIND_OPTS="-prune -writable -mmin -2"
WEBP="/usr/local/bin/webpfy.sh"
GIF2WEBP="/usr/local/bin/gif2webpfy.sh"
JPEG2000="/usr/local/bin/jp2fy.sh"
JXR="/usr/local/bin/jxrfy.sh"
TMP_PATH="/path/to/tmp"

function finish () {
  if [ -e "$ERRORLOG" ]; then
    rm $ERRORLOG
  fi
}

trap finish EXIT

# temporary files
ERRORLOG=$(mktemp "$TMP_PATH/XXXXXX.log")

# find GIF images and pipe their filenames to a script
find /path/to/images $FIND_GIFS $FIND_OPTS -print \
  | $GIF2WEBP 2>$ERRORLOG

# find JPG and PNG images and pipe their filenames to a script
find /path/to/images $FIND_IMGS $FIND_OPTS -print \
  | $WEBP 2>$ERRORLOG \
  | $JPEG2000 2>$ERRORLOG \
  | $JXR 2>$ERRORLOG

# filter out useless (non actionable) errors from the log
cat $ERRORLOG 2>/dev/null | grep -v \
  -e "file size changed while zipping" \
  -e "chown failed: Operation not permitted" \
  -e "mv: cannot create regular file" \
  -e "Invalid filename:" \
  >$ERRORLOG

# in case of any error, do something (here we send them over email)
if [ -s $ERRORLOG ]
then
  mail -s "job errors: re-encode images" $EMAIL <$ERRORLOG
  exit 1
fi

exit 0
}
```


### Committing the new file

Below is an example script to copy the temporary file at its new location:
```bash
#!/usr/bin/env bash
{
SRC_FILENAME="$1"
TMPFILE="$2"
DST_FILENAME="$3"

if [ ! -s "$SRC_FILENAME" ]
then
    echo "$SRC_FILENAME" >/dev/null
    exit 0
fi

if [ ! -s "$TMPFILE" ]
then
    echo "$TMPFILE" >/dev/null
    exit 0
fi

#>&2 echo "committing $SRC_FILENAME to $DST_FILENAME via $TMPFILE..."
if [ ! -f "$DST_FILENAME" ]
then
    touch "$DST_FILENAME"
fi

SRC_SIZE=$(stat -c%s "$SRC_FILENAME")
DST_SIZE=$(stat -c%s "$TMPFILE")
EXIST_SIZE=$(stat -c%s "$DST_FILENAME")

#>&2 echo "orig=$SRC_FILENAME=$SRC_SIZE B | work=$TMPFILE=$DST_SIZE B | live=$DST_FILENAME=$EXIST_SIZE B"
if [ "$DST_SIZE" -gt "$SRC_SIZE" ]
then
    #>&2 echo "skipped $TMPFILE as $DST_FILENAME (bigger than the original)"
    rm "$DST_FILENAME"
else
    # note: we aren't copying directly at the final location
    # because the copy may take time and requests are coming in
    # 1- copy all attributes from the original
    touch --reference="$SRC_FILENAME" "$TMPFILE" 2>/dev/null
    chmod --reference="$SRC_FILENAME" "$TMPFILE" 2>/dev/null
    chown --reference="$SRC_FILENAME" "$TMPFILE" 2>/dev/null
    # 2- move the new file to its final location
    mv "$TMPFILE" "$DST_FILENAME"
    #>&2 echo "copied $TMPFILE to $DST_FILENAME"
fi

exit
}
```


### Putting it all together

Set the launcher script as a cronjob as often as you like, depending on the time constraints you applied to the find command in your scripts. You want the job to run at least as often as these constraints will be looking for files.

If you plan to run the script often, you may want to to ensure that the same images aren't processed several times. This can be done with lock files dropped in the `/var/run` folder. For example:
* Compute the hash of the input file name and use it as the file name of a lock file;
* If the lock file doesn't exist, write the current PID to the lock file;
* Otherwise, check its timestamp to abort the previous run or the current run of the encoder script and then update the lock file if necessary.

An example of the data savings that can be achieved [is shown in this very repo](../../commit/c89797520186244a80f14e1662fc0df89663c000 "Image Optimisations for this repo").



### Improving even further

When an original file is updated on disk, we can be reasonably sure that any alternate formats will be obsolete. We don't need to (and we shouldn't) wait for the encoding to finish to determine this, and we should delete these files as soon as the process is started. This could be a good first step in each chain of encodings: delete all alternate formats whose timestamp are older than the original file they were made from.

Another area for improvement would be to watch for file updates (possibly using `inotifywait`) instead of scheduling the process, so that the encoding can start as early as possible.

Finally, the chain of encodings could be done in parallel instead of sequentially, since each format is not dependent on the result of any other format.

However, you may want to watch out for the number of processes running at the same time. You may use up all the memory or even reach the maximum number of processes your system can handle at once. At that point, you may want to look into splitting your batch processing load.


1. [Guidelines](./chapters/guidelines/README.md)
1. [Front-end](./chapters/front-end/README.md)
1. **[Scripts](./chapters/scripts/README.md)** (end of this chapter)



[Brotli]: https://github.com/google/brotli
[LZMA]: https://tukaani.org/xz/
[JPEG-XR]: https://jxrlib.codeplex.com/releases/view/107208
[Zopfli]: https://github.com/google/zopfli
[WebP]: https://github.com/webmproject/libwebp
[ImageMagick]: https://github.com/ImageMagick/ImageMagick/releases
[JPEG-2000]: https://github.com/uclouvain/openjpeg/
[Guetzli]: https://github.com/google/guetzli
[Butteraugli]: https://github.com/google/butteraugli
[MSWSL]: https://docs.microsoft.com/en-us/windows/wsl/install-win10
[caniuse-br]: https://caniuse.com/#feat=brotli
[caniuse-jxr]: https://caniuse.com/#feat=jpegxr
[caniuse-webp]: https://caniuse.com/#search=webp
[edge-webp]: https://developer.microsoft.com/en-us/microsoft-edge/platform/status/webpimageformat/
