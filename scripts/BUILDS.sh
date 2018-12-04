#!/usr/bin/env bash
{
apt-get install ntp certbot locate make gcc g++ gcc-multilib pkg-config autoconf automake zip libbz2-dev libfreetype6-dev libgif-dev docbook-xsl python-dev python3-dev golang git unzip mailutils htop postfix libsasl2-modules libtool sudo sysstat dpkg-dev python libde265-dev tcl8.5 libxpm-dev libunistring-dev libfftw3-dev openbsd-inetd libicu-dev nfs-common

cd /usr/local/src && \
wget https://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz && \
tar -xzf autoconf-2.69.tar.gz && \
cd autoconf-2.69 && \
make clean >/dev/null ; ./configure && make && make install

cd /usr/local/src && \
wget https://ftp.gnu.org/gnu/automake/automake-1.13.4.tar.gz && \
tar -xzf automake-1.13.4.tar.gz && \
cd automake-1.13.4 && \
make clean >/dev/null ; ./configure && make && make install

cd /usr/local/src && \
wget https://ftp.gnu.org/gnu/automake/automake-1.16.1.tar.gz && \
tar -xzf automake-1.16.1.tar.gz && \
cd automake-1.16.1 && \
make clean >/dev/null ; ./configure && make && make install

cd /usr/local/src && \
wget https://cmake.org/files/v3.12/cmake-3.12.2.tar.gz && \
tar -xzf cmake-3.12.2.tar.gz && \
cd cmake-3.12.2 && \
make clean >/dev/null ; ./configure && make && make install

cd /usr/local/src && \
wget https://ftp.nluug.nl/pub/gnu/libtool/libtool-2.4.6.tar.gz && \
tar -xzf libtool-2.4.6.tar.gz && \
cd libtool-2.4.6 && \
make clean >/dev/null ; ./configure --enable-ltdl-install && make && make install
ln -s /usr/local/lib/libltdl.so /usr/lib/libltdl.so

cd /usr/local/src && \
wget https://github.com/nih-at/libzip/archive/rel-1-5-1.tar.gz -O libzip-1.5.1.tar.gz && \
tar -xzf libzip-1.5.1.tar.gz && mv libzip-rel-1-5-1 libzip-1.5.1 && \
cd libzip-1.5.1 && \
rm -R build 2>/dev/null ; mkdir build 2>/dev/null && \
cd build && cmake .. && make clean >/dev/null ; make && make install

cd /usr/local/src && \
wget https://github.com/madler/zlib/archive/v1.2.11.tar.gz -O zlib-1.2.11.tar.gz && \
tar -xzf zlib-1.2.11.tar.gz && \
cd zlib-1.2.11 && \
make clean >/dev/null ; ./configure --shared --prefix=/usr/local && make && make install

cd /usr/local/src && \
wget https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.32.tar.bz2 && \
tar -xjf libgpg-error-1.32.tar.bz2 && \
cd libgpg-error-1.32 && \
make clean >/dev/null ; ./configure && make && make install

cd /usr/local/src && \
wget https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.8.3.tar.bz2 && \
tar -xjf libgcrypt-1.8.3.tar.bz2 && \
cd libgcrypt-1.8.3 && \
make clean >/dev/null ; ./configure && make && make install

cd /usr/local/src && \
wget https://www.openssl.org/source/openssl-1.1.1.tar.gz && \
tar -xzf openssl-1.1.1.tar.gz && \
cd openssl-1.1.1 && \
make clean 2>/dev/null ; ./config --prefix=/usr/local --openssldir=/usr/local/openssl no-gost shared zlib no-ssl2 -fPIC && \
make depend && make && make install && openssl version
ln -s /usr/local/lib/libssl.so.1.1 /usr/lib/libssl.so.1.1
ln -s /usr/local/lib/libcrypto.so.1.1 /usr/lib/libcrypto.so.1.1

cd /usr/local/src && \
wget https://www.openssl.org/source/openssl-1.0.2p.tar.gz && \
tar -xzf openssl-1.0.2p.tar.gz && \
cd openssl-1.0.2p && \
make clean 2>/dev/null ; ./config --prefix=/usr/local --openssldir=/usr/local/openssl no-gost shared zlib no-ssl2 -fPIC && \
make depend && make && make install && openssl version
ln -s /usr/local/lib/libssl.so.1.0.0 /usr/lib/libssl.so.1.0.0
ln -s /usr/local/lib/libcrypto.so.1.0.0 /usr/lib/libcrypto.so.1.0.0

cd /usr/local/src && \
wget https://www.libssh2.org/download/libssh2-1.8.0.tar.gz && \
tar -xzf libssh2-1.8.0.tar.gz && \
cd libssh2-1.8.0 && \
make clean >/dev/null ; ./configure --with-openssl --with-libz && make && make install

cd /usr/local/src && \
wget https://alpha.gnu.org/gnu/libidn/libidn-1.17.tar.gz && \
tar -xzf libidn-1.17.tar.gz && \
cd libidn-1.17 && \
make clean >/dev/null ; ./configure && make && make install

cd /usr/local/src && \
wget https://alpha.gnu.org/gnu/libidn/libidn2-2.0.0.tar.gz && \
tar -xzf libidn2-2.0.0.tar.gz && \
cd libidn2-2.0.0 && \
make clean >/dev/null ; ./configure && make && make install

cd /usr/local/src && \
wget https://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.15.tar.gz
tar -xzf libiconv-1.15.tar.gz
cd libiconv-1.15
make clean >/dev/null ; ./configure --enable-shared && make && make install

cd /usr/local/src && \
wget https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz
tar -xzf libevent-2.1.8-stable.tar.gz
cd libevent-2.1.8-stable
make clean >/dev/null ; ./configure && make && make install

cd /usr/local/src && \
wget http://dist.schmorp.de/libev/libev-4.24.tar.gz
tar -xzf libev-4.24.tar.gz
cd libev-4.24
make clean >/dev/null ; ./configure && make && make install
ln -s /usr/local/lib/libev.so.4 /usr/lib/libev.so.4

cd /usr/local/src && \
wget https://tukaani.org/xz/xz-5.2.4.tar.bz2 && \
tar -xjf xz-5.2.4.tar.bz2 && \
cd xz-5.2.4 && \
make clean >/dev/null ; ./configure && make && make install

cd /usr/local/src && \
wget ftp://xmlsoft.org/libxml2/libxml2-2.9.8.tar.gz && \
tar -xzf libxml2-2.9.8.tar.gz && \
cd libxml2-2.9.8 && \
make clean 2>/dev/null ; ./configure && make && make install

cd /usr/local/src && \
wget ftp://xmlsoft.org/libxml2/libxslt-1.1.32.tar.gz && \
tar -xzf libxslt-1.1.32.tar.gz && \
cd libxslt-1.1.32 && \
make clean 2>/dev/null ; ./configure && make && make install

cd /usr/local/src && \
wget https://launchpad.net/libmetalink/trunk/libmetalink-0.1.3/+download/libmetalink-0.1.3.tar.bz2 && \
tar -xjf libmetalink-0.1.3.tar.bz2 && \
cd libmetalink-0.1.3 && \
./configure --with-libxml2 --with-xml-prefix=/usr/local && \
make clean >/dev/null ; make && make install
ln -s /usr/local/lib/libmetalink.so.3 /usr/lib/libmetalink.so.3

cd /usr/local/src && \
wget http://www.ijg.org/files/jpegsrc.v9c.tar.gz && \
tar -xzf jpegsrc.v9c.tar.gz && \
cd jpeg-9c && \
make clean >/dev/null ; ./configure --enable-shared && make && make install

cd /usr/local/src && \
wget https://ftp-osl.osuosl.org/pub/libpng/src/libpng16/libpng-1.6.34.tar.gz && \
tar -xzf libpng-1.6.34.tar.gz && \
cd libpng-1.6.34 && \
make clean >/dev/null ; ./configure 'CPPFLAGS=-I/usr/local/include' 'LDFLAGS=-L/usr/local/lib' --prefix=/usr/local --with-zlib-prefix=/usr/local --disable-static && \
make && make check && make install

cd /usr/local/src && \
wget https://download.savannah.gnu.org/releases/freetype/freetype-2.9.1.tar.bz2 && \
tar -xjf freetype-2.9.1.tar.bz2 && \
cd freetype-2.9.1 && \
make clean >/dev/null ; ./configure --with-zlib --with-png && make && make install

cd /usr/local/src && \
wget https://ftp.gnu.org/gnu/gss/gss-1.0.3.tar.gz && \
tar -xzf gss-1.0.3.tar.gz && \
cd gss-1.0.3 && \
./configure --with-libiconv-prefix=/usr/local && \
make clean >/dev/null ; make && make install

cd /usr/local/src && \
wget https://github.com/jemalloc/jemalloc/releases/download/5.1.0/jemalloc-5.1.0.tar.bz2 && \
tar -xjf jemalloc-5.1.0.tar.bz2 && \
cd jemalloc-5.1.0 && \
make clean >/dev/null ; ./configure && make && make install
ln -s /usr/local/lib/libjemalloc.so.2 /usr/lib/libjemalloc.so.2

cd /usr/local/src && \
wget http://www.digip.org/jansson/releases/jansson-2.11.tar.bz2 && \
tar -xjf jansson-2.11.tar.bz2 && \
cd jansson-2.11 && \
make clean >/dev/null ; ./configure && make && make install
ln -s /usr/local/lib/libjansson.so.4 /usr/lib/libjansson.so.4

#cd /usr/local/src && \
#wget https://github.com/tatsuhiro-t/spdylay/releases/download/v1.4.0/spdylay-1.4.0.tar.bz2 && \
#tar -xjf spdylay-1.4.0.tar.bz2 && \
#cd spdylay-1.4.0 && \
#make clean >/dev/null ; ./configure && make && make install

cd /usr/local/src && \
wget https://c-ares.haxx.se/download/c-ares-1.14.0.tar.gz && \
tar -xzf c-ares-1.14.0.tar.gz && \
cd c-ares-1.14.0 && \
make clean >/dev/null ; ./configure && make && make install
ln -s /usr/local/lib/libcares.so.2 /usr/lib/libcares.so.2

cd /usr/local/src && \
wget https://github.com/nghttp2/nghttp2/releases/download/v1.34.0/nghttp2-1.34.0.tar.bz2 && \
tar -xjf nghttp2-1.34.0.tar.bz2 && \
cd nghttp2-1.34.0 && \
make clean >/dev/null ; ./configure --with-libxml2 --with-jemalloc --disable-examples --enable-app && \
make && make install && nghttp --version

#cd /usr/local/src && \
#wget https://www.mirrorservice.org/sites/ftp.cac.washington.edu/imap/imap-2007f.tar.gz && \
#tar -xzf imap-2007f.tar.gz && \
#cd imap-2007f && \
#make clean >/dev/null ; make ldb IP6=4 EXTRACFLAGS=-fPIC

cd /usr/local/src && \
wget https://github.com/rockdaboot/libpsl/releases/download/libpsl-0.20.2/libpsl-0.20.2.tar.gz && \
tar -xzf libpsl-0.20.2.tar.gz && \
cd libpsl-0.20.2 && \
make clean >/dev/null ; ./configure && make && make install

#cd /usr/local/src && \
#wget https://download.icu-project.org/files/icu4c/62.1/icu4c-62_1-src.tgz && \
#tar -xzf icu4c-62_1-src.tgz && \
#cd icu4c-62_1-src/source && \
#chmod +x runConfigureICU configure install-sh && \
#./runConfigureICU Linux && make && make install

cd /usr/local/src && \
wget https://github.com/google/brotli/archive/v1.0.6.tar.gz -O brotli-1.0.6.tar.gz && \
tar -xzf brotli-1.0.6.tar.gz && \
cd brotli-1.0.6 && \
make clean >/dev/null ; ./configure-cmake && make && make install
ln -s /usr/local/lib/libbrotlicommon.so.1 /usr/lib/libbrotlicommon.so.1

cd /usr/local/src && \
wget https://rtmpdump.mplayerhq.hu/download/rtmpdump-2.3.tgz
tar -xzf rtmpdump-2.3.tgz
cd rtmpdump-2.3
make clean 2>/dev/null ; make && make install

cd /usr/local/src && \
wget https://curl.haxx.se/download/curl-7.61.1.tar.bz2 && \
tar -xjf curl-7.61.1.tar.bz2 && \
cd curl-7.61.1 && \
make clean >/dev/null ; ./configure --enable-shared --with-ssl --with-nghttp2 --with-zlib --with-libmetalink --with-gssapi --with-libssh2 --with-brotli --with-librtmp && \
make && make install && curl --version &&
ln -s /usr/local/lib/libcurl.so.4 /usr/lib/libcurl.so.4
curl https://cert-test.sandbox.google.com/ --head --fail --silent --show-error | head -n1

cd /usr/local/src && \
wget https://github.com/uclouvain/openjpeg/archive/v2.3.0.tar.gz -O openjpeg-2.3.0.tar.gz && \
tar -xzf openjpeg-2.3.0.tar.gz && \
cd openjpeg-2.3.0 && \
rm -R build 2>/dev/null ; mkdir build && \
cd build && cmake .. && make && make install && \
ln -s /usr/local/lib/libopenjp2.so.7 /usr/lib/libopenjp2.so.7

cd /usr/local/src && \
wget https://www.kokkonen.net/tjko/src/jpeginfo-1.6.1.tar.gz && \
tar -xzf jpeginfo-1.6.1.tar.gz && \
cd jpeginfo-1.6.1 && \
make clean >/dev/null ; ./configure --with-libjpeg=/usr/local && \
make && make install

cd /usr/local/src && \
wget https://www.kokkonen.net/tjko/src/jpegoptim-1.4.6.tar.gz && \
tar -xzf jpegoptim-1.4.6.tar.gz && \
cd jpegoptim-1.4.6 && \
./configure --with-libjpeg=/usr/local && \
make && make strip && make install

cd /usr/local/src && \
wget https://ftp.pcre.org/pub/pcre/pcre-8.42.tar.bz2 && \
tar -xjf pcre-8.42.tar.bz2 && \
cd pcre-8.42 && \
make clean 2>/dev/null ; ./configure --enable-utf --enable-pcre16 --enable-pcre32 --enable-unicode-properties --enable-pcregrep-libz --enable-pcregrep-libbz2 --enable-jit && \
make && make install

cd /usr/local/src && \
wget https://ftp.pcre.org/pub/pcre/pcre2-10.32.tar.bz2 && \
tar -xjf pcre2-10.32.tar.bz2 && \
cd pcre2-10.32 && \
make clean 2>/dev/null ; ./configure --enable-utf --enable-pcre2-16 --enable-pcre2-32 --enable-unicode-properties --enable-pcre2grep-libz --enable-pcre2grep-libbz2 --enable-jit && \
make && make install

cd /usr/local/src && \
wget http://apache.crihan.fr/dist/apr/apr-1.6.5.tar.bz2 && \
tar -xjf apr-1.6.5.tar.bz2 && \
cd apr-1.6.5 && \
make clean 2>/dev/null ; ./configure && make && make install

cd /usr/local/src && \
wget http://mirror.ibcp.fr/pub/apache//apr/apr-util-1.6.1.tar.bz2 && \
tar -xjf apr-util-1.6.1.tar.bz2 && \
cd apr-util-1.6.1 && \
make clean 2>/dev/null ; ./configure --with-apr=/usr/local/src/apr-1.6.5 --with-openssl=/usr/local && \
make && make install

cd /usr/local/src && \
wget https://ftp.gnu.org/gnu/gawk/gawk-4.2.1.tar.gz && \
tar -xzf gawk-4.2.1.tar.gz && \
cd gawk-4.2.1 && \
make clean 2>/dev/null ; ./configure && make && make install

cd /usr/local/src && \
wget https://github.com/ArtifexSoftware/jbig2dec/archive/0.15.tar.gz -O jbig2dec-0.15.tar.gz && \
tar -xzf jbig2dec-0.15.tar.gz && \
cd jbig2dec-0.15 && \
make clean 2>/dev/null ; ./autogen.sh && ./configure && make && make install

cd /usr/local/src && \
wget https://download.osgeo.org/libtiff/tiff-4.0.9.tar.gz && \
tar -xzf tiff-4.0.9.tar.gz && \
cd tiff-4.0.9 && \
make clean >/dev/null ; ./configure 'CPPFLAGS=-I/usr/local/include' 'LDFLAGS=-L/usr/local/lib' && \
make && make install

cd /usr/local/src && \
wget https://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz && \
tar -xzf yasm-1.3.0.tar.gz && \
cd yasm-1.3.0 && \
make clean 2>/dev/null ; ./configure && make && make install

cd /usr/local/src && \
wget https://github.com/google/zopfli/archive/zopfli-1.0.2.tar.gz && \
tar -xzf zopfli-1.0.2.tar.gz && \
cd zopfli-zopfli-1.0.2 && \
make clean >/dev/null 2>/dev/null ; make && make zopflipng && \
cp zopfli /usr/local/sbin/ && cp zopflipng /usr/local/sbin/

cd /usr/local/src && \
wget https://github.com/amadvance/advancecomp/releases/download/v2.1/advancecomp-2.1.tar.gz && \
tar -xzf advancecomp-2.1.tar.gz && \
cd advancecomp-2.1 && \
make clean >/dev/null ; ./configure && make && make install

cd /usr/local/src && \
wget https://codeplexarchive.blob.core.windows.net/archive/projects/jxrlib/jxrlib.zip && \
mkdir jxrlib ; cd jxrlib && unzip ../jxrlib.zip
cd /usr/local/src/jxrlib/sourceCode/jxrlib && \
make clean 2>/dev/null ; make && cp build/Jxr*App /usr/local/bin/

cd /usr/local/src && \
wget https://github.com/webmproject/libwebp/archive/v1.0.0.tar.gz -O libwebp-1.0.0.tar.gz && \
tar -xzf libwebp-1.0.0.tar.gz && \
cd libwebp-1.0.0 && \
./autogen.sh && ./configure --enable-libwebpmux --enable-libwebpdemux --enable-libwebpdecoder --enable-libwebpextras --with-giflibdir=/usr/local
make && make install && cwebp -version
ln -s /usr/local/lib/libwebpdemux.so.2 /usr/lib/libwebpdemux.so.2
ln -s /usr/local/lib/libwebp.so.7 /usr/lib/libwebp.so.7

cd /usr/local/src && \
wget https://github.com/webmproject/libvpx/archive/v1.7.0.tar.gz -O libvpx-1.7.0.tar.gz && \
tar -xzf libvpx-1.7.0.tar.gz && \
cd libvpx-1.7.0 && \
make clean >/dev/null ; ./configure --enable-pic --enable-shared && make && make install

cd /usr/local/src && \
wget https://github.com/mdadams/jasper/archive/version-2.0.14.tar.gz -O jasper-2.0.14.tar.gz && \
tar -xzf jasper-2.0.14.tar.gz && mv jasper-version-2.0.14 jasper-2.0.14 && \
mkdir jasper-2.0.14/build ; cd jasper-2.0.14 && \
cmake -G "Unix Makefiles" -H. -Bbuild -DCMAKE_INSTALL_PREFIX=/usr/local && \
cd build && make clean all && make install

cd /usr/local/src && \
wget https://github.com/mm2/Little-CMS/archive/lcms2.9.tar.gz && \
tar -xzf lcms2.9.tar.gz && \
cd Little-CMS-lcms2.9 && \
./configure && make && make install

cd /usr/local/src && \
wget https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs925/ghostpdl-9.25.tar.gz && \
tar -xzf ghostpdl-9.25.tar.gz && \
cd ghostpdl-9.25 && \
make clean >/dev/null ; ./configure && make && make install && make so && make soinstall

cd /usr/local/src && \
wget https://www.imagemagick.org/download/delegates/libfpx-1.3.1-10.tar.bz2 && \
tar -xjf libfpx-1.3.1-10.tar.bz2 && \
cd libfpx-1.3.1-10 && \
make clean >/dev/null ; ./configure && make && make install

#now that we have more adequate libs, rebuild freetype
cd /usr/local/src && \
cd freetype-2.9.1 && \
make clean >/dev/null ; ./configure --with-zlib --with-png && make && make install

cd /usr/local/src && \
wget https://graphviz.gitlab.io/pub/graphviz/stable/SOURCES/graphviz.tar.gz -O graphviz-2.40.1.tar.gz && \
tar -xzf graphviz-2.40.1.tar.gz && \
cd graphviz-2.40.1 && \
make clean >/dev/null ; ./configure --with-webp=yes --with-freetype2=yes --enable-ltdl --enable-php && make && make install

cd /usr/local/src && \
wget https://www.imagemagick.org/download/ImageMagick-7.0.8-11.tar.bz2 && \
tar -xjf ImageMagick-7.0.8-11.tar.bz2 && \
cd ImageMagick-7.0.8-11 && \
make clean >/dev/null ; ./configure --prefix=/usr/local --enable-shared --disable-openmp --with-modules=no --with-webp=yes --with-gslib=no --with-openjp2=yes --with-gvc=yes --with-fftw=yes --with-heic=yes --with-gslib=yes && \
make && make install && magick --version

cd /usr/local/src && \
wget https://github.com/mstorsjo/fdk-aac/archive/v0.1.6.tar.gz -O fdk-aac-0.1.6.tar.gz && \
tar -xzf fdk-aac-0.1.6.tar.gz && \
cd fdk-aac-0.1.6 && \
./autogen.sh && autoreconf --force --install && ./configure --enable-shared --enable-static && make && make install

cd /usr/local/src && \
wget https://www.nasm.us/pub/nasm/releasebuilds/2.13.03/nasm-2.13.03.tar.bz2 && \
tar -xjf nasm-2.13.03.tar.bz2 && \
cd nasm-2.13.03
make clean 2>/dev/null ; ./configure && make && make install

cd /usr/local/src && \
wget ftp://ftp.videolan.org/pub/x264/snapshots/last_x264.tar.bz2 -O x264.tar.bz2 && \
rm -R x264-snapshot-* ; tar -xjf x264.tar.bz2 && \
cd x264-snapshot-* && \
make clean 2>/dev/null ; ./configure --enable-shared --enable-static --enable-libfdk-aac --disable-asm && make && make install

cd /usr/local/src && \
wget https://github.com/FFmpeg/FFmpeg/archive/n4.0.2.tar.gz -O ffmpeg-4.0.2.tar.gz && \
tar -xzf ffmpeg-4.0.2.tar.gz && \
cd FFmpeg-n4.0.2 && \
make clean 2>/dev/null ; ./configure --enable-gpl --enable-nonfree --enable-libx264 --enable-shared --enable-libvpx --enable-libwebp --enable-libfreetype --enable-libopenjpeg --enable-libfdk-aac --enable-linux-perf && make && make install

cd /usr/local/src && \
wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
tar -xjf phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
mkdir /usr/local/phantomjs ; cd phantomjs-2.1.1-linux-x86_64 && \
cp bin/phantomjs /usr/local/bin/phantomjs && cp examples/* /usr/local/phantomjs/

cd /usr/local/src && \
wget http://mirrors.ircam.fr/pub/apache//httpd/httpd-2.4.35.tar.bz2 && \
rm -R httpd-2.4.35 2>/dev/null; tar -xjf httpd-2.4.35.tar.bz2 && cd /usr/local/src/httpd-2.4.35 && \
./buildconf --with-apr=/usr/local/src/apr-1.6.5 --with-apr-util=/usr/local/src/apr-util-1.6.1 && \
./configure --prefix=/usr/local/apache2 --with-program-name=apache2 --with-mpm=prefork --disable-cgi --disable-imap --disable-autoindex --enable-mods-static="actions alias allowmethods auth-basic auth-digest authn-core authn-file authz-core authz-host authz-user autoindex brotli cache deflate dir disk-cache dumpio env expires file-cache filter headers http include info logio log-config mem-cache mime nghttp2-staticlib-deps negotiation proxy proxy-fcgi proxy-http proxy-html proxy-wstunnel rewrite remoteip setenvif slotmem_shm so socache-shmcb ssl status substitute unique-id unixd xml2enc" && \
make && make install

cd /usr/local/src && \
wget https://github.com/jedisct1/libsodium/releases/download/1.0.16/libsodium-1.0.16.tar.gz
tar -xzf libsodium-1.0.16.tar.gz
cd libsodium-1.0.16
make clean >/dev/null ; ./autogen.sh && ./configure && make && make install
ln -s /usr/local/lib/libsodium.so.23 /usr/lib/libsodium.so.23

cd /usr/local/src && \
wget https://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-1.0.47.tar.bz2 && \
tar -xjf pure-ftpd-1.0.47.tar.bz2 && \
cd pure-ftpd-1.0.47 && \
./configure CFLAGS="-I/usr/local/include" LDFLAGS="-L/usr/local/lib" --with-puredb --with-tls --with-rfc2640 --with-ftpwho && \
make clean >/dev/null ; make && make install-strip
#ftp     stream  tcp     nowait  root    /usr/local/sbin/pure-ftpd --tls=3 -c 15 -C 15 -l puredb:/etc/pure-ftpd/pureftpd.pdb -X -E -j -R -Y 2 -z -p 50000:50400

cd /usr/local/src && \
rm -R ngx_brotli 2>/dev/null ; git clone --recursive https://github.com/google/ngx_brotli && \
cd ngx_brotli && git submodule update --init --recursive

cd /usr/local/src && \
rm -R ngx_http_substitutions_filter_module 2>/dev/null ; git clone git://github.com/yaoweibin/ngx_http_substitutions_filter_module.git

cd /usr/local/src && \
wget https://github.com/vozlt/nginx-module-vts/archive/v0.1.18.tar.gz -O nginx-module-vts-0.1.18-0.1.18.tar.gz && \
tar -xzf nginx-module-vts-0.1.18-0.1.18.tar.gz && \
cd nginx-module-vts-0.1.18

cd /usr/local/src && \
wget https://nginx.org/download/nginx-1.14.0.tar.gz && \
tar -xzf nginx-1.14.0.tar.gz && \
cd nginx-1.14.0 && \
make clean 2>/dev/null ; ./configure --with-cc-opt="-Wno-deprecated-declarations -I/usr/local/include" --with-ld-opt="-L/usr/local/lib" --with-cpu-opt=amd64 --sbin-path=/usr/local/sbin --with-http_ssl_module --without-mail_pop3_module --without-mail_imap_module --without-mail_smtp_module --with-mail_ssl_module --with-http_gunzip_module --with-http_stub_status_module --with-http_gzip_static_module --with-stream --with-stream_ssl_module --with-pcre --with-http_v2_module --with-http_realip_module --add-module=/usr/local/src/nginx-module-vts-0.1.18 --add-module=/usr/local/src/ngx_http_substitutions_filter_module --add-module=/usr/local/src/ngx_brotli --conf-path=/etc/nginx/nginx.conf && \
make && ./objs/nginx -V && make install

cd /usr/local/src && \
wget https://nginx.org/download/nginx-1.15.3.tar.gz && \
tar -xzf nginx-1.15.3.tar.gz && \
cd nginx-1.15.3 && \
make clean 2>/dev/null ; ./configure --with-cc-opt="-Wno-deprecated-declarations -I/usr/local/include" --with-ld-opt="-L/usr/local/lib" --with-cpu-opt=amd64 --sbin-path=/usr/local/sbin --with-http_ssl_module --without-mail_pop3_module --without-mail_imap_module --without-mail_smtp_module --with-mail_ssl_module --with-http_gunzip_module --with-http_stub_status_module --with-http_gzip_static_module --with-stream --with-stream_ssl_module --with-pcre --with-http_v2_module --with-http_realip_module --add-module=/usr/local/src/nginx-module-vts-0.1.18 --add-module=/usr/local/src/ngx_http_substitutions_filter_module --add-module=/usr/local/src/ngx_brotli --conf-path=/etc/nginx/nginx.conf && \
make && ./objs/nginx -V && make install

cd /usr/local/src && \
wget http://download.redis.io/releases/redis-4.0.11.tar.gz && \
tar -xzf redis-4.0.11.tar.gz
cd redis-4.0.11
make clean 2>/dev/null && make && make test && make install

cd /usr/local/src && \
wget https://ftp.gnu.org/gnu/bison/bison-3.1.tar.gz && \
tar -xzf bison-3.1.tar.gz && \
cd bison-3.1 && \
./configure && make && make install

cd /usr/local/src && \
wget https://github.com/skvadrik/re2c/archive/1.1.1.tar.gz -O re2c-1.1.1.tar.gz && \
tar -xzf re2c-1.1.1.tar.gz && \
cd re2c-1.1.1/re2c && \
./autogen.sh ; make && make install

cd /usr/local/src && \
wget https://github.com/htacg/tidy-html5/archive/5.6.0.tar.gz -O tidy-5.6.0.tar.gz && \
tar -xzf tidy-5.6.0.tar.gz && \
cd tidy-html5-5.6.0
cd build/cmake && cmake ../.. -DCMAKE_BUILD_TYPE=Release && make install

cd /usr/local/src/pecl && \
wget https://pecl.php.net/get/amqp-1.9.3.tgz && tar -xzf amqp-1.9.3.tgz && \
wget https://pecl.php.net/get/pecl_http-2.6.0.tgz && tar -xzf pecl_http-2.6.0.tgz && \
wget https://pecl.php.net/get/pecl_http-3.2.0.tgz && tar -xzf pecl_http-3.2.0.tgz && \
#wget https://pecl.php.net/get/igbinary-2.0.7.tgz && tar -xzf igbinary-2.0.7.tgz
wget https://pecl.php.net/get/redis-4.1.1.tgz && tar -xzf redis-4.1.1.tgz && \
wget https://pecl.php.net/get/raphf-1.1.2.tgz && tar -xzf raphf-1.1.2.tgz && \
wget https://pecl.php.net/get/raphf-2.0.0.tgz && tar -xzf raphf-2.0.0.tgz && \
wget https://pecl.php.net/get/propro-1.0.2.tgz && tar -xzf propro-1.0.2.tgz && \
wget https://pecl.php.net/get/propro-2.1.0.tgz && tar -xzf propro-2.1.0.tgz && \
wget https://pecl.php.net/get/imagick-3.4.3.tgz && tar -xzf imagick-3.4.3.tgz && \
wget https://pecl.php.net/get/timezonedb-2018.5.tgz && tar -xzf timezonedb-2018.5.tgz && \
wget https://pecl.php.net/get/ssh2-0.13.tgz && tar -xzf ssh2-0.13.tgz && \
wget https://pecl.php.net/get/ssh2-1.1.2.tgz && tar -xzf ssh2-1.1.2.tgz && \
wget https://pecl.php.net/get/libsodium-1.0.7.tgz && tar -xzf libsodium-1.0.7.tgz && \
wget https://pecl.php.net/get/libsodium-2.0.12.tgz && tar -xzf libsodium-2.0.12.tgz && \
wget https://pecl.php.net/get/tidy-1.2.tgz && tar -xzf tidy-1.2.tgz && sed -i 's/buffio.h/tidybuffio.h/' tidy-1.2/*.* && sed -i 's/tidytidybuffio.h/tidybuffio.h/' tidy-1.2/*.* && \
wget https://github.com/phalcon/cphalcon/archive/v3.4.1.tar.gz -O cphalcon-3.4.1.tar.gz && tar -xzf cphalcon-3.4.1.tar.gz && \
wget https://pecl.php.net/get/xdebug-2.5.5.tgz && tar -xzf xdebug-2.5.5.tgz && \
wget https://pecl.php.net/get/xdebug-2.6.1.tgz && tar -xzf xdebug-2.6.1.tgz

cd /usr/local/src && \
wget https://secure.php.net/distributions/php-5.6.38.tar.bz2 && \
cd /usr/local/src && \
rm -R php-5.6.38 2>/dev/null ; tar -xjf php-5.6.38.tar.bz2 && \
cd /usr/local/src/php-5.6.38 && \
rm -R ext/amqp 2>/dev/null ; mkdir ext/amqp && cp -R ../pecl/amqp-1.9.3/* ext/amqp/ && \
rm -R ext/http 2>/dev/null ; mkdir ext/http && cp -R ../pecl/pecl_http-2.6.0/* ext/http/ && \
#rm -R ext/igbinary 2>/dev/null ; mkdir ext/igbinary && cp -R ../pecl/igbinary-1.2.1/* ext/igbinary/
rm -R ext/redis 2>/dev/null ; mkdir ext/redis && cp -R ../pecl/redis-4.1.1/* ext/redis/ && \
rm -R ext/raphf 2>/dev/null ; mkdir ext/raphf && cp -R ../pecl/raphf-1.1.2/* ext/raphf/ && \
rm -R ext/propro 2>/dev/null ; mkdir ext/propro && cp -R ../pecl/propro-1.0.2/* ext/propro/ && \
rm -R ext/imagick 2>/dev/null ; mkdir ext/imagick && cp -R ../pecl/imagick-3.4.3/* ext/imagick/ && \
rm -R ext/timezonedb 2>/dev/null ; mkdir ext/timezonedb && cp -R ../pecl/timezonedb-2018.5/* ext/timezonedb/ && \
rm -R ext/ssh2 2>/dev/null ; mkdir ext/ssh2 && cp -R ../pecl/ssh2-0.13/* ext/ssh2/ && \
rm -R ext/libsodium 2>/dev/null ; mkdir ext/libsodium && cp -R ../pecl/libsodium-1.0.7/* ext/libsodium/ && \
rm -R ext/tidy 2>/dev/null ; mkdir ext/tidy && cp -R ../pecl/tidy-1.2/* ext/tidy/ && \
#rm -R ext/cphalcon 2>/dev/null ; mkdir ext/cphalcon && cp -R ../pecl/cphalcon-3.4.1/* ext/cphalcon/
#rm -R ext/xdebug 2>/dev/null ; mkdir ext/xdebug && cp -R ../pecl/xdebug-2.5.5/* ext/xdebug/
cd /usr/local/src/php-5.6.38 && \
rm configure 2>/dev/null ; ./buildconf --force && \
make clean 2>/dev/null ; ./configure --prefix=/usr/local/php56 --disable-all --with-apxs2=/usr/local/apache2/bin/apxs --with-iconv=/usr/local/lib --with-icu-dir=/usr/local --enable-libxml --enable-xml --enable-dom --enable-ctype --with-curl=/usr/local --enable-json --enable-session --enable-simplexml --with-sqlite3 --enable-pdo --with-pdo-mysql --with-pdo-sqlite --with-zlib=/usr/local --with-openssl --enable-soap --enable-bcmath --with-bz2 --enable-calendar --enable-exif --enable-ftp --with-gd --with-gettext --with-libxml-dir --enable-mbstring --with-pcre-dir --with-pcre-regex=/usr/local --enable-shmop --enable-sockets --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-wddx --with-xsl --enable-zip --with-geoip --enable-filter --enable-hash --enable-igbinary --with-mysqli --enable-tokenizer --enable-xmlreader --enable-xmlwriter --enable-posix --enable-gd-native-ttf --with-jpeg-dir=/usr/local --with-png-dir=/usr/local --with-freetype-dir=/usr/local --with-vpx-dir=/usr/local --with-imagick=/usr/local --enable-redis --enable-redis-igbinary --enable-timezonedb --enable-fileinfo --enable-intl --with-kerberos --enable-raphf --enable-propro --with-http-libevent-dir=/usr/local --with-http --enable-opcache --with-librabbitmq-dir=/usr/local --with-amqp --with-libsodium --with-mhash --with-mcrypt --with-tidy --with-ssh2=shared
make clean 2>/dev/null ; ./configure --prefix=/usr/local/php56 --disable-all --with-apxs2=/usr/local/apache2/bin/apxs --with-iconv=/usr/local/lib --enable-libxml --enable-xml --enable-dom --enable-ctype --with-curl=/usr/local --enable-json --enable-session --enable-simplexml --with-sqlite3 --enable-pdo --with-pdo-mysql --with-pdo-sqlite --with-zlib=/usr/local --with-openssl --enable-soap --enable-bcmath --with-bz2 --enable-calendar --enable-exif --enable-ftp --with-gd --with-gettext --with-libxml-dir --enable-mbstring --with-pcre-dir --with-pcre-regex=/usr/local --enable-shmop --enable-sockets --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-wddx --with-xsl --enable-zip --enable-filter --enable-hash --with-mysqli --enable-tokenizer --enable-xmlreader --enable-xmlwriter --enable-posix --enable-gd-native-ttf --with-jpeg-dir=/usr/local --with-png-dir=/usr/local --with-freetype-dir=/usr/local --with-vpx-dir=/usr/local --with-imagick=/usr/local --enable-redis --enable-timezonedb --enable-fileinfo --enable-intl --with-kerberos --enable-raphf --enable-propro --with-http-libevent-dir=/usr/local --with-http --enable-opcache --with-librabbitmq-dir=/usr/local --with-amqp --with-libsodium --with-ssh2=shared && \
make && ./sapi/cli/php -m && ./sapi/cli/php -v && make install && \
cd /usr/local/src/php-5.6.38/ext/xdebug && sh /usr/local/php56/bin/phpize && ./configure --with-php-config=/usr/local/php56/bin/php-config && make && make install && cd /usr/local/src/php-5.6.38 && \
cd /usr/local/src/php-5.6.38/ext/cphalcon/build && ./install --phpize /usr/local/php56/bin/phpize --php-config /usr/local/php56/bin/php-config && cd /usr/local/src/php-5.6.38 && \
php56 -m && php56 -v

cd /usr/local/src && \
wget https://secure.php.net/distributions/php-7.0.32.tar.bz2
cd /usr/local/src && \
rm -R php-7.0.32 2>/dev/null ; tar -xjf php-7.0.32.tar.bz2 && \
cd /usr/local/src/php-7.0.32
rm -R ext/amqp 2>/dev/null ; mkdir ext/amqp ; cp -R ../pecl/amqp-1.9.3/* ext/amqp/ && \
rm -R ext/http 2>/dev/null ; mkdir ext/http ; cp -R ../pecl/pecl_http-3.2.0/* ext/http/ && \
rm -R ext/redis 2>/dev/null ; mkdir ext/redis ; cp -R ../pecl/redis-4.1.1/* ext/redis/ && \
rm -R ext/raphf 2>/dev/null ; mkdir ext/raphf ; cp -R ../pecl/raphf-2.0.0/* ext/raphf/ && \
rm -R ext/propro 2>/dev/null ; mkdir ext/propro ; cp -R ../pecl/propro-2.1.0/* ext/propro/ && \
rm -R ext/imagick 2>/dev/null ; mkdir ext/imagick ; cp -R ../pecl/imagick-3.4.3/* ext/imagick/ && \
rm -R ext/timezonedb 2>/dev/null ; mkdir ext/timezonedb ; cp -R ../pecl/timezonedb-2018.5/* ext/timezonedb/ && \
rm -R ext/ssh2 2>/dev/null ; mkdir ext/ssh2 ; cp -R ../pecl/ssh2-1.1.2/* ext/ssh2/ && \
rm -R ext/libsodium 2>/dev/null ; mkdir ext/libsodium ; cp -R ../pecl/libsodium-1.0.7/* ext/libsodium/ && \
rm -R ext/tidy 2>/dev/null ; mkdir ext/tidy && cp -R ../pecl/tidy-1.2/* ext/tidy/ && \
cd /usr/local/src/php-7.0.32 && \
rm configure 2>/dev/null ; ./buildconf --force && \
make clean 2>/dev/null ; ./configure --prefix=/usr/local/php70 --disable-all --with-iconv=/usr/local/lib --enable-libxml --with-libxml-dir --enable-xml --enable-dom --enable-ctype --with-curl=/usr/local --enable-json --enable-session --enable-simplexml --enable-pdo --with-pdo-mysql --with-zlib=/usr/local --with-openssl --with-openssl-dir=/usr/local/lib --enable-soap --enable-bcmath --with-bz2 --enable-calendar --enable-exif --enable-ftp --with-gd --with-gettext --enable-mbstring --with-pcre-dir --with-pcre-regex=/usr/local --enable-shmop --enable-sockets --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-wddx --with-xsl --enable-zip --enable-filter --enable-hash --with-mysqli --enable-tokenizer --enable-xmlreader --enable-xmlwriter --enable-posix --enable-gd-native-ttf --with-jpeg-dir --with-png-dir --with-xpm-dir --with-freetype-dir --with-webp-dir --with-imagick=/usr/local --enable-redis --enable-timezonedb --enable-fileinfo --enable-intl --with-kerberos --enable-opcache --with-librabbitmq-dir=/usr/local --with-amqp --with-libsodium --with-ssh2=shared && \
make && ./sapi/cli/php -m && ./sapi/cli/php -v && \
make install && php70 -m && php70 -v && \
cd /usr/local/src/php-7.0.32/ext/xdebug && sh /usr/local/php70/bin/phpize && ./configure --with-php-config=/usr/local/php70/bin/php-config && make && make install && cd /usr/local/src/php-7.0.32 && \
cd /usr/local/src/php-7.0.32/ext/cphalcon/build && ./install --phpize /usr/local/php70/bin/phpize --php-config /usr/local/php70/bin/php-config && cd /usr/local/src/php-7.0.32 && \
php70 -m && php70 -v

cd /usr/local/src && \
wget https://secure.php.net/distributions/php-7.1.22.tar.bz2 && \
cd /usr/local/src && \
rm -R php-7.1.22 2>/dev/null ; tar -xjf php-7.1.22.tar.bz2 && \
cd /usr/local/src/php-7.1.22
rm -R ext/amqp 2>/dev/null ; mkdir ext/amqp ; cp -R ../pecl/amqp-1.9.3/* ext/amqp/ && \
rm -R ext/http 2>/dev/null ; mkdir ext/http ; cp -R ../pecl/pecl_http-3.1.0/* ext/http/ && \
rm -R ext/redis 2>/dev/null ; mkdir ext/redis ; cp -R ../pecl/redis-4.1.1/* ext/redis/ && \
rm -R ext/raphf 2>/dev/null ; mkdir ext/raphf ; cp -R ../pecl/raphf-2.0.0/* ext/raphf/ && \
rm -R ext/propro 2>/dev/null ; mkdir ext/propro ; cp -R ../pecl/propro-2.1.0/* ext/propro/ && \
rm -R ext/imagick 2>/dev/null ; mkdir ext/imagick ; cp -R ../pecl/imagick-3.4.3/* ext/imagick/ && \
rm -R ext/timezonedb 2>/dev/null ; mkdir ext/timezonedb ; cp -R ../pecl/timezonedb-2018.5/* ext/timezonedb/ && \
rm -R ext/ssh2 2>/dev/null ; mkdir ext/ssh2 ; cp -R ../pecl/ssh2-1.1.1/* ext/ssh2/ && \
rm -R ext/libsodium 2>/dev/null ; mkdir ext/libsodium ; cp -R ../pecl/libsodium-1.0.7/* ext/libsodium/ && \
rm -R ext/tidy 2>/dev/null ; mkdir ext/tidy && cp -R ../pecl/tidy-1.2/* ext/tidy/ && \
rm -R ext/cphalcon 2>/dev/null ; mkdir ext/cphalcon ; cp -R ../pecl/cphalcon-3.4.1/* ext/cphalcon/ && \
rm -R ext/xdebug 2>/dev/null ; mkdir ext/xdebug ; cp -R ../pecl/xdebug-2.6.1/* ext/xdebug/ && \
cd /usr/local/src/php-7.1.22 && \
rm configure 2>/dev/null ; ./buildconf --force && \
make clean 2>/dev/null ; ./configure --prefix=/usr/local/php71 --disable-all --with-iconv=/usr/local/lib --enable-libxml --with-libxml-dir=/usr/local --enable-xml --enable-dom --enable-ctype --with-curl=/usr/local --enable-json --enable-session --enable-simplexml --enable-pdo --with-pdo-mysql --with-zlib=/usr/local --with-openssl --with-openssl-dir=/usr/local/lib --enable-soap --enable-bcmath --with-bz2 --enable-calendar --enable-exif --enable-ftp --with-gd --with-gettext --enable-mbstring --with-pcre-dir --with-pcre-regex=/usr/local --enable-shmop --enable-sockets --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-wddx --with-xsl --enable-zip --enable-filter --enable-hash --with-mysqli --enable-tokenizer --enable-xmlreader --enable-xmlwriter --enable-posix --enable-gd-native-ttf --with-jpeg-dir=/usr/local --with-png-dir=/usr/local --with-xpm-dir=/usr/local --with-freetype-dir=/usr/local --with-webp-dir=/usr/local --with-imagick=/usr/local --enable-redis --enable-timezonedb --enable-fileinfo --enable-intl --with-kerberos --enable-opcache --with-librabbitmq-dir=/usr/local --with-amqp --with-libsodium --with-ssh2=shared && \
make && ./sapi/cli/php -m && ./sapi/cli/php -v && \
make install && php71 -m && php71 -v && \
cd /usr/local/src/php-7.1.22/ext/xdebug && sh /usr/local/php71/bin/phpize && ./configure --with-php-config=/usr/local/php71/bin/php-config && make && make install && cd /usr/local/src/php-7.1.22 && \
cd /usr/local/src/php-7.1.22/ext/cphalcon/build && ./install --phpize /usr/local/php71/bin/phpize --php-config /usr/local/php71/bin/php-config && cd /usr/local/src/php-7.1.22 && \
php71 -m && php71 -v

cd /usr/local/src && \
wget https://secure.php.net/distributions/php-7.2.9.tar.bz2 && \
cd /usr/local/src && \
rm -R php-7.2.9 2>/dev/null ; tar -xjf php-7.2.9.tar.bz2 && \
cd /usr/local/src/php-7.2.9 && \
rm -R ext/amqp 2>/dev/null ; mkdir ext/amqp ; cp -R ../pecl/amqp-1.9.3/* ext/amqp/ && \
rm -R ext/redis 2>/dev/null ; mkdir ext/redis ; cp -R ../pecl/redis-4.1.1/* ext/redis/ && \
rm -R ext/imagick 2>/dev/null ; mkdir ext/imagick ; cp -R ../pecl/imagick-3.4.3/* ext/imagick/ && \
rm -R ext/timezonedb 2>/dev/null ; mkdir ext/timezonedb ; cp -R ../pecl/timezonedb-2018.5/* ext/timezonedb/ && \
rm -R ext/ssh2 2>/dev/null ; mkdir ext/ssh2 ; cp -R ../pecl/ssh2-1.1.1/* ext/ssh2/ && \
rm -R ext/libsodium 2>/dev/null ; mkdir ext/libsodium ; cp -R ../pecl/libsodium-1.0.7/* ext/libsodium/ && \
rm -R ext/tidy 2>/dev/null ; mkdir ext/tidy && cp -R ../pecl/tidy-1.2/* ext/tidy/ && \
rm -R ext/cphalcon 2>/dev/null ; mkdir ext/cphalcon ; cp -R ../pecl/cphalcon-3.4.1/* ext/cphalcon/ && \
rm -R ext/xdebug 2>/dev/null ; mkdir ext/xdebug ; cp -R ../pecl/xdebug-2.6.1/* ext/xdebug/ && \
cd /usr/local/src/php-7.2.9 && \
rm configure 2>/dev/null ; ./buildconf --force && \
make clean 2>/dev/null ; ./configure --prefix=/usr/local/php72 --disable-all --with-iconv=/usr/local/lib --enable-libxml --with-libxml-dir=/usr/local --enable-xml --enable-dom --enable-ctype --with-curl=/usr/local --enable-json --enable-session --enable-simplexml --enable-pdo --with-pdo-mysql --with-zlib=/usr/local --with-openssl --with-openssl-dir=/usr/local/lib --enable-soap --enable-bcmath --with-bz2 --enable-calendar --enable-exif --enable-ftp --with-gd --with-gettext --enable-mbstring --with-pcre-dir --with-pcre-regex=/usr/local --enable-shmop --enable-sockets --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-wddx --with-xsl --with-libzip=/usr/local --enable-zip --enable-filter --enable-hash --with-mysqli --enable-tokenizer --enable-xmlreader --enable-xmlwriter --enable-posix --with-jpeg-dir=/usr/local --with-png-dir=/usr/local --with-xpm-dir=/usr/local --with-freetype-dir=/usr/local --with-webp-dir=/usr/local --with-imagick=/usr/local --enable-redis --enable-timezonedb --enable-fileinfo --enable-intl --with-kerberos --enable-opcache --with-librabbitmq-dir=/usr/local --with-amqp --with-sodium --with-ssh2=shared && \
make && ./sapi/cli/php -m && ./sapi/cli/php -v && \
make install && php72 -m && php72 -v && \
cd /usr/local/src/php-7.2.9/ext/xdebug && sh /usr/local/php72/bin/phpize && ./configure --with-php-config=/usr/local/php72/bin/php-config && make && make install && cd /usr/local/src/php-7.2.9 && \
cd /usr/local/src/php-7.2.9/ext/cphalcon/build && ./install --phpize /usr/local/php72/bin/phpize --php-config /usr/local/php72/bin/php-config && cd /usr/local/src/php-7.2.9 && \
php72 -m && php72 -v

cd /usr/local/src && \
wget https://downloads.php.net/~cmb/php-7.3.0beta3.tar.bz2 && \
cd /usr/local/src && \
rm -R php-7.3.0beta3 2>/dev/null ; tar -xjf php-7.3.0beta3.tar.bz2 && \
cd /usr/local/src/php-7.3.0beta3 && \
rm -R ext/amqp 2>/dev/null ; mkdir ext/amqp ; cp -R ../pecl/amqp-1.9.3/* ext/amqp/ && \
#rm -R ext/igbinary 2>/dev/null ; mkdir ext/igbinary ; cp -R ../pecl/igbinary-2.0.5/* ext/igbinary/
rm -R ext/redis 2>/dev/null ; mkdir ext/redis ; cp -R ../pecl/redis-4.1.1/* ext/redis/ && \
rm -R ext/imagick 2>/dev/null ; mkdir ext/imagick ; cp -R ../pecl/imagick-3.4.3/* ext/imagick/ && \
rm -R ext/timezonedb 2>/dev/null ; mkdir ext/timezonedb ; cp -R ../pecl/timezonedb-2018.5/* ext/timezonedb/ && \
rm -R ext/ssh2 2>/dev/null ; mkdir ext/ssh2 ; cp -R ../pecl/ssh2-1.1.1/* ext/ssh2/ && \
rm -R ext/libsodium 2>/dev/null ; mkdir ext/libsodium ; cp -R ../pecl/libsodium-1.0.7/* ext/libsodium/ && \
rm -R ext/tidy 2>/dev/null ; mkdir ext/tidy && cp -R ../pecl/tidy-1.2/* ext/tidy/ && \
rm -R ext/cphalcon 2>/dev/null ; mkdir ext/cphalcon ; cp -R ../pecl/cphalcon-3.4.1/* ext/cphalcon/ && \
rm -R ext/xdebug 2>/dev/null ; mkdir ext/xdebug ; cp -R ../pecl/xdebug-2.6.1/* ext/xdebug/ && \
cd /usr/local/src/php-7.3.0beta3 && \
rm configure 2>/dev/null ; ./buildconf --force && \
make clean 2>/dev/null ; ./configure --prefix=/usr/local/php73 --disable-all --with-iconv=/usr/local/lib --enable-libxml --with-libxml-dir=/usr/local --enable-xml --enable-dom --enable-ctype --with-curl=/usr/local --enable-json --enable-session --enable-simplexml --enable-pdo --with-pdo-mysql --with-zlib=/usr/local --with-openssl --with-openssl-dir=/usr/local/lib --enable-soap --enable-bcmath --with-bz2 --enable-calendar --enable-exif --enable-ftp --with-gd --with-gettext --enable-mbstring --with-pcre-dir --with-pcre-regex=/usr/local --enable-shmop --enable-sockets --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-wddx --with-xsl --with-libzip=/usr/local --enable-zip --enable-filter --enable-hash --with-mysqli --enable-tokenizer --enable-xmlreader --enable-xmlwriter --enable-posix --with-jpeg-dir=/usr/local --with-png-dir=/usr/local --with-xpm-dir=/usr/local --with-freetype-dir=/usr/local --with-webp-dir=/usr/local --with-imagick=/usr/local --enable-redis --enable-timezonedb --enable-fileinfo --enable-intl --with-kerberos --enable-opcache --with-sodium && \
make && ./sapi/cli/php -m && ./sapi/cli/php -v && make install && php73 -m && php73 -v && \
cd /usr/local/src/php-7.3.0beta3/ext/xdebug && sh /usr/local/php73/bin/phpize && ./configure --with-php-config=/usr/local/php73/bin/php-config && make && make install && cd /usr/local/src/php-7.3.0beta3 && \
cd /usr/local/src/php-7.3.0beta3/ext/cphalcon/build && ./install --phpize /usr/local/php73/bin/phpize --php-config /usr/local/php73/bin/php-config && cd /usr/local/src/php-7.3.0beta3 && \
php73 -m && php73 -v

}
