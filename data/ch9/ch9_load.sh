#!/bin/bash

# customizable variables
DSBULK_PATH=/Users/denisegosnell/Desktop/Book/dse-6.8.0_20190911-LABS/dsbulk-1.3.4/bin
DATADIR=/Users/denisegosnell/Desktop/Book/graph-book/data/ch9

DEST_KS=paths_prod

echo "Loading vertices into the graph $DEST_KS"
cd $DSBULK_PATH
./dsbulk load -k $DEST_KS -t Address -url "$DATADIR/Address.csv" -header true

echo "Completed loading vertices into the graph $DEST_KS."

echo "Loading edges into the graph $DEST_KS"

./dsbulk load -k $DEST_KS -t Address__rated__Address -url "$DATADIR/rated.csv" -header true

echo "Completed loading edges into the graph $DEST_KS."

