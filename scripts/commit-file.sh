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

#>&2 echo "orig=$SRC_FILENAME=$SRC_SIZE io | work=$TMPFILE=$DST_SIZE io | live=$DST_FILENAME=$EXIST_SIZE io"

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
