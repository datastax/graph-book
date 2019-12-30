#!/bin/bash

# You may set the following variables inside script, or override corresponding
# variables when running the script
DEFAULT_DSBULK_PATH=/PATH/TO/dsbulk-1.3.4
DEFAULT_DESK_KS=movies_dev

# Allow to override these variables via environment variables set before executing script
DSBULK_PATH=${DSBULK_PATH:-$DEFAULT_DSBULK_PATH}
DEST_KS=${DEST_KS:-$DEFAULT_DESK_KS}

############################################
# Automated data loading
# Assuming you set DSBULK_PATH and DEST_KS
############################################

# collect directory variables
OLDWD="`pwd`"
SCRIPTDIR="`dirname $0`"
cd "$SCRIPTDIR"

# determine which dsbulk to use, in the case you already have it installed
# the path that is set in the script, takes over the value from PATH
DSBULK=$DSBULK_PATH/bin/dsbulk
if [ ! -f "$DSBULK" ]; then
    DSBULK="`which dsbulk`"
    if [ -z "$DSBULK" ]; then
        echo "Please set DSBULK_PATH variable to top-level path of DSBulk distribution"
        echo "  or add directory with dsbulk to PATH, like, 'PATH=...dsbulk-1.3.4/bin:\$PATH'"
        exit 1
    fi
fi

############################################
# load the vertices
############################################
echo "Loading vertices into the graph $DEST_KS"

echo "Extracting data files for loading..."
tar xvzf movies_dev_data.tar.gz

echo "Loading vertices into the graph $DEST_KS"
$DSBULK load -k $DEST_KS -t Movie -url Movie.csv -header true
$DSBULK load -k $DEST_KS -t User -url User.csv -header true
$DSBULK load -k $DEST_KS -t Tag -url Tag.csv -header true
$DSBULK load -k $DEST_KS -t Genre -url Genre.csv -header true
$DSBULK load -k $DEST_KS -t Actor -url Actor.csv -header true

echo "Completed loading vertices into the graph $DEST_KS."

############################################
# load the edges
############################################
echo "Loading edges into the graph $DEST_KS"

$DSBULK load -k $DEST_KS -t Movie__belongs_to__Genre -url belongs_to.csv -header true
$DSBULK load -k $DEST_KS -t Movie__topic_tagged__Tag -url topic_tag_100k_sample.csv -header true
$DSBULK load -k $DEST_KS -t User__rated__Movie -url rated_100k_sample.csv -header true
$DSBULK load -k $DEST_KS -t User__tagged__Movie -url tagged.csv -header true
$DSBULK load -k $DEST_KS -t Actor__acted_in__Movie -url acted_in.csv -header true
$DSBULK load -k $DEST_KS -t Actor__collaborated_with__Actor -url collaborator.csv -header true

echo "Completed loading edges into the graph $DEST_KS."

cd "$OLDWD"
