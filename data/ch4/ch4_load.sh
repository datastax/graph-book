#!/bin/bash

# You may set the following variables inside script, or override corresponding
# variables when running the script
DEFAULT_DSBULK_PATH=/PATH/TO/dsbulk-1.4.2
DEFAULT_DEST_KS=neighborhoods_dev

# Allow to override these variables via environment variables set before executing script
DSBULK_PATH=${DSBULK_PATH:-$DEFAULT_DSBULK_PATH}
DEST_KS=${DEST_KS:-$DEFAULT_DEST_KS}

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

$DSBULK load -g $DEST_KS -v Transaction -url Transactions.csv -header true 
$DSBULK load -g $DEST_KS -v Vendor -url Vendors.csv -header true 
$DSBULK load -g $DEST_KS -v Customer -url Customers.csv -header true 
$DSBULK load -g $DEST_KS -v Loan -url Loans.csv -header true 
$DSBULK load -g $DEST_KS -v Account -url Accounts.csv -header true 
$DSBULK load -g $DEST_KS -v CreditCard -url CreditCards.csv -header true 

echo "Completed loading vertices into the graph $DEST_KS."

############################################
# load the edges
############################################
echo "Loading edges into the graph $DEST_KS"

$DSBULK load -g $DEST_KS -e owes -from Customer -to Loan -url owes.csv -header true 
$DSBULK load -g $DEST_KS -e owns -from Customer -to Account -url owns.csv -header true 
$DSBULK load -g $DEST_KS -e uses -from Customer -to CreditCard -url uses.csv -header true 
$DSBULK load -g $DEST_KS -e charge -from Transaction -to CreditCard -url charge.csv -header true 
$DSBULK load -g $DEST_KS -e deposit_to -from Transaction -to Account -url deposit_to.csv -header true 
$DSBULK load -g $DEST_KS -e withdraw_from -from Transaction -to Account -url withdraw_from.csv -header true 
$DSBULK load -g $DEST_KS -e pay -from Transaction -to Loan -url pay_loan.csv -header true 
$DSBULK load -g $DEST_KS -e pay -from Transaction -to Vendor -url pay_vendor.csv -header true 

echo "Completed loading edges into the graph $DEST_KS."

cd "$OLDWD"
