#!/bin/bash

# customizable variables
DSBULK_PATH=/PATH/TO/dsbulk-1.3.4/bin
DATADIR=/PATH/TO/graph-book/data/ch8

DEST_KS=paths_dev

echo "Loading vertices into the graph $DEST_KS"
cd $DSBULK_PATH
./dsbulk load -k $DEST_KS -t Address -url "$DATADIR/Address.csv" -header true

echo "Completed loading vertices into the graph $DEST_KS."

echo "Loading edges into the graph $DEST_KS"

./dsbulk load -k $DEST_KS -t Address__rated__Address -url "$DATADIR/rated.csv" -header true

echo "Completed loading edges into the graph $DEST_KS."

