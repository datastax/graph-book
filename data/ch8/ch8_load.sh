#!/bin/bash

# Please set the following variables
DSBULK_PATH=/PATH/TO/dsbulk-1.3.4
DEST_KS=paths_dev

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


$DSBULK load -k $DEST_KS -t Address -url "$DATADIR/Address.csv" -header true

echo "Completed loading vertices into the graph $DEST_KS."

############################################
# load the edges
############################################
echo "Loading edges into the graph $DEST_KS"

$DSBULK load -k $DEST_KS -t Address__rated__Address -url "$DATADIR/rated.csv" -header true

echo "Completed loading edges into the graph $DEST_KS."

cd "$OLDWD"
