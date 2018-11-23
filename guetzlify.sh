#!/usr/bin/env bash
{
COMMIT_BIN="/usr/local/bin/commit-file.sh"
GUETZLI_BIN="/usr/local/bin/guetzli"
GUETZLI_OPTS="--quality 95"
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

		TARGET_FILENAME="$SRC_FILENAME.$EXT"
		if [ ! $SRC_FILENAME = *".jpg.jpg" ]
		then
			TMPFILE=$(mktemp $TMP_PATH/XXXXXX.$EXT)
			$GUETZLI_BIN $GUETZLI_OPTS "$SRC_FILENAME" "$TMPFILE"

			$COMMIT_BIN "$SRC_FILENAME" "$TMPFILE" "$SRC_FILENAME.$EXT"
		fi
	fi
}

trap finish EXIT

if [ -z "$1" ]
then
	# no specified path: use STDIN instead
	while read SRC_PATH
	do
		compress_custom "$SRC_PATH"
	done
else
	# use specified path
	SRC_PATH="$1"
	if [ -d "$SRC_PATH" ]
	then
		for img_filename in $(find "$SRC_PATH" -regex '.+/images/home-cycle/.+\.\(jpg\|jpeg\|png\)$')
		do
			compress_custom "$img_filename"
		done
	else
		if [ -s "$SRC_PATH" ]
		then
			# echo "filename..."
			compress_custom "$SRC_PATH"
		fi
	fi
fi

exit
}
