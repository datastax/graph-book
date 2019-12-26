#!/bin/bash

# customizable variables
DSBULK_PATH=/PATH/TO/dsbulk-1.3.4/bin
DATADIR=/PATH/TO/graph-book/data/ch10

DEST_KS=movies_dev

echo "Loading vertices into the graph $DEST_KS"
cd $DSBULK_PATH

./dsbulk load -k $DEST_KS -t Movie -url "$DATADIR/Movie.csv" -header true
./dsbulk load -k $DEST_KS -t User -url "$DATADIR/User.csv" -header true
./dsbulk load -k $DEST_KS -t Tag -url "$DATADIR/Tag.csv" -header true
./dsbulk load -k $DEST_KS -t Genre -url "$DATADIR/Genre.csv" -header true
./dsbulk load -k $DEST_KS -t Actor -url "$DATADIR/Actor.csv" -header true

echo "Completed loading vertices into the graph $DEST_KS."

echo "Loading edges into the graph $DEST_KS"

./dsbulk load -k $DEST_KS -t Movie__belongs_to__Genre -url "$DATADIR/belongs_to.csv" -header true
./dsbulk load -k $DEST_KS -t Movie__topic_tag__Tag -url "$DATADIR/topic_tag_100k_sample.csv" -header true
./dsbulk load -k $DEST_KS -t User__rated__Movie -url "$DATADIR/rated_100k_sample.csv" -header true
./dsbulk load -k $DEST_KS -t User__tagged__Movie -url "$DATADIR/tagged.csv" -header true
./dsbulk load -k $DEST_KS -t Actor__acted_in__Movie -url "$DATADIR/acted_in.csv" -header true
./dsbulk load -k $DEST_KS -t Actor__collaborator__Actor -url "$DATADIR/collaborator.csv" -header true

echo "Completed loading edges into the graph $DEST_KS."

