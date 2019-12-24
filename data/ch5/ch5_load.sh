#!/bin/bash

# customizable variables
DSBULK_PATH=/PATH/TO/dsbulk-1.3.4/bin
DATADIR=/PATH/TO/graph-book/data/ch5

DEST_KS=neighborhoods_prod

echo "Loading vertices into the graph $DEST_KS"
cd $DSBULK_PATH

$DSBULK load -k $DEST_KS -t Transaction -url "$DATADIR/Transactions.csv" -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Vendor -url "$DATADIR/Vendors.csv" -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Customer -url "$DATADIR/Customers.csv" -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Loan -url "$DATADIR/Loans.csv" -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t Account -url "$DATADIR/Accounts.csv" -header true --schema.allowMissingFields true
$DSBULK load -k $DEST_KS -t CreditCard -url "$DATADIR/CreditCards.csv" -header true --schema.allowMissingFields true

echo "Completed loading vertices into the graph $DEST_KS."

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
