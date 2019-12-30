#!/bin/bash

# You may set the following variables inside script, or override corresponding
# variables when running the script
DEFAULT_DSBULK_PATH=/PATH/TO/dsbulk-1.3.4
DEFAULT_DESK_KS=neighborhoods_prod

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

$DSBULK load -k $DEST_KS -t Transaction -url Transactions.csv -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Vendor -url Vendors.csv -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Customer -url Customers.csv -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Loan -url Loans.csv -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Account -url Accounts.csv -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t CreditCard -url CreditCards.csv -header true --schema.allowMissingFields true

echo "Completed loading vertices into the graph $DEST_KS."

############################################
# load the edges
############################################
echo "Loading edges into the graph $DEST_KS"

$DSBULK load -k $DEST_KS -t Customer__owes__Loan -url owes.csv -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Customer__owns__Account -url owns.csv -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Customer__uses__CreditCard -url uses.csv -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Transaction__charge__CreditCard -url charge.csv -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Transaction__deposit_to__Account -url deposit_to.csv -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Transaction__withdraw_from__Account -url withdraw_from.csv -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Transaction__pay__Loan -url pay_loan.csv -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Transaction__pay__Vendor -url pay_vendor.csv -header true --schema.allowMissingFields true

echo "Completed loading edges into the graph $DEST_KS."

cd "$OLDWD"
