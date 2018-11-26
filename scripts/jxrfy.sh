#!/usr/bin/env bash
{
COMMIT_BIN="/usr/local/bin/commit-file.sh"
IMAGICK_BIN="/usr/local/bin/magick"
JXR_BIN="/usr/local/bin/JxrEncApp"
JXR_OPTS="-q 10"
EXT="jxr"
TMP_PATH="/path/to/tmp"

function finish () {
	if [ -e "$TMPFILE" ]; then
		rm $TMPFILE
	fi
}

function compress_custom () {
	SRC_FILENAME="$1"
	if [ -s "$SRC_FILENAME" ]
	then
		echo "$SRC_FILENAME"

		TMPFILE_BMP=$(mktemp $TMP_PATH/XXXXXX.bmp)
		$IMAGICK_BIN "$SRC_FILENAME" "$TMPFILE_BMP"

		if [ -s "$TMPFILE_BMP" ]
		then
			TMPFILE_JXR=$(mktemp $TMP_PATH/XXXXXX.$EXT)
			$JXR_BIN -i "$TMPFILE_BMP" -o "$TMPFILE_JXR" $JXR_OPTS >/dev/null 2>/dev/null

			$COMMIT_BIN "$SRC_FILENAME" "$TMPFILE_JXR" "$SRC_FILENAME.$EXT"
		fi
	fi
}

trap finish EXIT

if [ -z "$1" ]
then
	while read SRC_PATH
	do
		compress_custom $SRC_PATH
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
