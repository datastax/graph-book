#!/bin/bash

# customizable variables
DSBULK_PATH=/PATH/TO/dsbulk-1.3.4/bin
DATADIR=/PATH/TO/graph-book/data/ch6

DEST_KS=trees_dev

echo "Loading vertices into the graph $DEST_KS"
cd $DSBULK_PATH
./dsbulk load -k $DEST_KS -t Sensor -url "$DATADIR/Sensor.csv" -header true
./dsbulk load -k $DEST_KS -t Tower -url "$DATADIR/Tower.csv" -header true


echo "Completed loading vertices into the graph $DEST_KS."

echo "Loading edges into the graph $DEST_KS"

./dsbulk load -k $DEST_KS -t Sensor__send__Sensor -url "$DATADIR/Sensor__send__Sensor.csv" -header true
./dsbulk load -k $DEST_KS -t Sensor__send__Tower -url "$DATADIR/Sensor__send__Tower.csv" -header true

echo "Completed loading edges into the graph $DEST_KS."

