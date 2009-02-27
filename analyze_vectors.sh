#!/bin/sh
REFDEC="$HOME/Projects/14496-5/x86/mpeg4audio/bin/mp4mcDec/Linux_isomp4_AFsp_gcc_O0d/mp4audec_mc -DVh"
DIR="$HOME/Projects/14496-4/mpeg4audio-conformance/compressedMp4"

echo "{|"
for FILE in `find $DIR -iname \*.mp4 | sort`
do
    SHORTFILE=`echo $FILE | sed "s|$DIR/||"`
    echo "|-"
    $REFDEC $FILE out.wav 2>&1 >/dev/null | ./parse_tools.pl $SHORTFILE
done
echo "|}"
