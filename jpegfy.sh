#!/usr/bin/env bash
{
COMMIT_BIN="/usr/local/bin/commit-file.sh"
JPEG_BIN="/usr/local/bin/jpegtran"
JPEG_OPTS="-optimize -progressive"
EXT="jpg"
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

		TMPFILE=$(mktemp $TMP_PATH/XXXXXX.$EXT)
		$JPEG_BIN $JPEG_OPTS -outfile "$TMPFILE" "$SRC_FILENAME"

		$COMMIT_BIN "$SRC_FILENAME" "$TMPFILE" "$SRC_FILENAME.$EXT"
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
		for img_filename in $(find "$SRC_PATH" -regex '.+\.\(jpg\|jpeg\|png\)$' ! -path "*/images/home-cycle/*" ! -path "*/images/blog/tickets/*" ! -path "*/images/blog/old/*" ! -path "*/images/mails/*")
		do
			compress_custom "$img_filename"
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
