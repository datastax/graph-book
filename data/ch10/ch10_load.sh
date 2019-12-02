#!/bin/bash

# Please set the following variables
DSBULK_PATH=/PATH/TO/dsbulk-1.3.4
DEST_KS=movies_dev

############################################
# Automated data loading
# Assuming you set DSBULK_PATH and DEST_KS
############################################

# collect directory variables
OLDWD="`pwd`"
SCRIPTIR="`dirname $0`"
cd "$SCRIPTDIR"
DATADIR="`pwd`"

# determine which dsbulk to use, in the case you already have it installed
DSBULK="`which dsbulk`"
if [ -z "$DSBULK" ]; then
    if [ ! -f "$DSBULK_PATH/bin/dsbulk" ]; then
        echo "Please set DSBULK_PATH variable to top-level path of DSBulk distribution"
        echo "  or add directory with dsbulk to PATH, like, 'PATH=...dsbulk-1.3.4/bin:\$PATH'"
        exit 1
    fi
fi
DSBULK=$DSBULK_PATH/bin/dsbulk

############################################
# load the vertices
############################################
echo "Loading vertices into the graph $DEST_KS"

echo "Extracting data files for loading..."
cd $DATADIR
tar xvzf movies_dev_data.tar.gz

echo "Loading vertices into the graph $DEST_KS"
$DSBULK load -k $DEST_KS -t Movie -url "$DATADIR/Movie.csv" -header true
$DSBULK load -k $DEST_KS -t User -url "$DATADIR/User.csv" -header true
$DSBULK load -k $DEST_KS -t Tag -url "$DATADIR/Tag.csv" -header true
$DSBULK load -k $DEST_KS -t Genre -url "$DATADIR/Genre.csv" -header true
$DSBULK load -k $DEST_KS -t Actor -url "$DATADIR/Actor.csv" -header true

echo "Completed loading vertices into the graph $DEST_KS."

############################################
# load the edges
############################################
echo "Loading edges into the graph $DEST_KS"

$DSBULK load -k $DEST_KS -t Movie__belongs_to__Genre -url "$DATADIR/belongs_to.csv" -header true
$DSBULK load -k $DEST_KS -t Movie__topic_tag__Tag -url "$DATADIR/topic_tag_100k_sample.csv" -header true
$DSBULK load -k $DEST_KS -t User__rated__Movie -url "$DATADIR/rated_100k_sample.csv" -header true
$DSBULK load -k $DEST_KS -t User__tagged__Movie -url "$DATADIR/tagged.csv" -header true
$DSBULK load -k $DEST_KS -t Actor__acted_in__Movie -url "$DATADIR/acted_in.csv" -header true
$DSBULK load -k $DEST_KS -t Actor__collaborator__Actor -url "$DATADIR/collaborator.csv" -header true

echo "Completed loading edges into the graph $DEST_KS."

cd "$OLDWD"
