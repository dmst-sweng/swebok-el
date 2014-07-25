#!/bin/sh

set -x

# Rotate images with more than 6 horizontal categories
if [ `grep -c '^	[^	]' $1` -ge 6 ]
then
	ROTATE=-Grotate=90
fi

recode cp-1253/..UTF-8 <$1 |
./tab2dot.pl |
dot -Gsize=8,11 -Gdpi=300 -Tpng $ROTATE |
# Set physical dimensions to 300 dpi
pngtopnm |
pnmtopng -size='11811 11811 1' >$2
