#!/usr/bin/env bash
{
COMMIT_BIN="/usr/local/bin/commit-file.sh"
BROTLI_BIN=/usr/local/sbin/bro
BROTLI_OPTS="--force"
EXT=br
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
		$BROTLI_BIN $BROTLI_OPTS --input "$SRC_FILENAME" --output "$TMPFILE"

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
	if [ -s "$SRC_PATH" ]
	then
		compress_custom "$SRC_PATH"
	else
		if [ -d "$SRC_PATH" ]
		then
			for static_filename in $(find "$SRC_PATH" -regex '.+\.\(js\|css\|html\|eot\|ttf\|woff\|svg\|otf\|txt\|xml\)$')
			do
				compress_custom "$static_filename"
			done
		fi
	fi
fi

exit
}
