#!/bin/bash

# Please set the following variables
DSBULK_PATH=/PATH/TO/dsbulk-1.3.4
DEST_KS=neighborhoods_prod

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

$DSBULK load -k $DEST_KS -t Transaction -url "$DATADIR/Transactions.csv" -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Vendor -url "$DATADIR/Vendors.csv" -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Customer -url "$DATADIR/Customers.csv" -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Loan -url "$DATADIR/Loans.csv" -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Account -url "$DATADIR/Accounts.csv" -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t CreditCard -url "$DATADIR/CreditCards.csv" -header true --schema.allowMissingFields true

echo "Completed loading vertices into the graph $DEST_KS."

############################################
# load the edges
############################################
echo "Loading edges into the graph $DEST_KS"

$DSBULK load -k $DEST_KS -t Customer__owes__Loan -url "$DATADIR/owes.csv" -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Customer__owns__Account -url "$DATADIR/owns.csv" -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Customer__uses__CreditCard -url "$DATADIR/uses.csv" -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Transaction__charge__CreditCard -url "$DATADIR/charge.csv" -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Transaction__deposit_to__Account -url "$DATADIR/deposit_to.csv" -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Transaction__withdraw_from__Account -url "$DATADIR/withdraw_from.csv" -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Transaction__pay__Loan -url "$DATADIR/pay_loan.csv" -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Transaction__pay__Vendor -url "$DATADIR/pay_vendor.csv" -header true --schema.allowMissingFields true

echo "Completed loading edges into the graph $DEST_KS."

cd "$OLDWD"
