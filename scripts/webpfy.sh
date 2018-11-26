#!/usr/bin/env bash
{
COMMIT_BIN="/usr/local/bin/commit-file.sh"
WEBP_BIN="/usr/local/bin/cwebp"
WEBP_OPTS="-alpha_cleanup -quiet -m 6 -q 90 -sharpness 0 -metadata none -mt"
EXT="webp"
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
		$WEBP_BIN $WEBP_OPTS "$SRC_FILENAME" -o "$TMPFILE"

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
	SRC_PATH=$1
	if [ -d "$SRC_PATH" ]
	then
		for img_filename in $(find "$SRC_PATH" -regex '.+\.\(jpg\|jpeg\|png\)$' | grep -v images/home-cycle/ | grep -v images/blog/tickets | grep -v images/blog/old | grep -v images/mails/)
		do
			compress_custom $img_filename
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
