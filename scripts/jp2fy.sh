#!/usr/bin/env bash
{
COMMIT_BIN="/usr/local/bin/commit-file.sh"
IMAGICK_BIN="/usr/local/bin/magick"
JP2000_BIN="/usr/local/bin/opj_compress"
JP2000_OPTS="-q 30,40,50"
EXT="jp2"
TMP_PATH="/path/to/tmp"

function finish () {
	if [ -e "$TMPFILE" ]; then
		rm $TMPFILE
	fi
}

function compress_custom () {
	SRC_FILENAME="$1"
	if [ -s $SRC_FILENAME ]
	then
		echo "$SRC_FILENAME"

		TMPFILE_PNG=$(mktemp $TMP_PATH/XXXXXX.png)
		$IMAGICK_BIN "$SRC_FILENAME" "$TMPFILE_PNG"

		if [ -s "$TMPFILE_PNG" ]
		then
			TMPFILE_JP2=$(mktemp $TMP_PATH/XXXXXX.$EXT)
			$JP2000_BIN $JP2000_OPTS -i "$TMPFILE_PNG" -o "$TMPFILE_JP2" >/dev/null 2>/dev/null

			$COMMIT_BIN "$SRC_FILENAME" "$TMPFILE_JP2" "$SRC_FILENAME.$EXT"
		fi
	fi
}

trap finish EXIT

if [ -z "$1" ]
then
	while read SRC_PATH
	do
		compress_custom "$SRC_PATH"
	done
else
	SRC_PATH="$1"
	if [ -d "$SRC_PATH" ]
	then
		for IMG_FILENAME in $(find "$SRC_PATH" -regex '.+\.\(jpg\|jpeg\|png\)$' | grep -v images/home-cycle/ | grep -v images/blog/tickets | grep -v images/blog/old | grep -v images/mails/)
		do
			compress_custom "$IMG_FILENAME"
		done
	else
		if [ -s "$SRC_PATH" ]
		then
			echo "filename..."
			compress_custom "$SRC_PATH"
		fi
	fi
fi

exit
}
