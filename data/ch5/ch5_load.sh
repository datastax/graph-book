#!/bin/bash

cd /path/to/dse-6.8.0_20190911-LABS/dsbulk-1.3.4/bin

echo "Loading vertices into the graph neighborhoods_prod"

./dsbulk load -k neighborhoods_prod -t Transaction -url /path/to/graph-book/data/ch5/Transactions.csv -header true -schema.allowMissingFields true
./dsbulk load -k neighborhoods_prod -t Vendor -url /path/to/graph-book/data/ch5/Vendors.csv -header true -schema.allowMissingFields true
./dsbulk load -k neighborhoods_prod -t Customer -url /path/to/graph-book/data/ch5/Customers.csv -header true -schema.allowMissingFields true
./dsbulk load -k neighborhoods_prod -t Loan -url /path/to/graph-book/data/ch5/Loans.csv -header true -schema.allowMissingFields true
./dsbulk load -k neighborhoods_prod -t Account -url /path/to/graph-book/data/ch5/Accounts.csv -header true -schema.allowMissingFields true
./dsbulk load -k neighborhoods_prod -t CreditCard -url /path/to/graph-book/data/ch5/CreditCards.csv -header true -schema.allowMissingFields true

echo "Completed loading vertices into the graph neighborhoods_prod."

echo "Loading edges into the graph neighborhoods_prod"

./dsbulk load -k neighborhoods_prod -t Customer__owes__Loan -url /path/to/graph-book/data/ch5/owes.csv -header true -schema.allowMissingFields true
./dsbulk load -k neighborhoods_prod -t Customer__owns__Account -url /path/to/graph-book/data/ch5/owns.csv -header true -schema.allowMissingFields true
./dsbulk load -k neighborhoods_prod -t Customer__uses__CreditCard -url /path/to/graph-book/data/ch5/uses.csv -header true -schema.allowMissingFields true
./dsbulk load -k neighborhoods_prod -t Transaction__charge__CreditCard -url /path/to/graph-book/data/ch5/charge.csv -header true -schema.allowMissingFields true
./dsbulk load -k neighborhoods_prod -t Transaction__deposit_to__Account -url /path/to/graph-book/data/ch5/deposit_to.csv -header true -schema.allowMissingFields true
./dsbulk load -k neighborhoods_prod -t Transaction__withdraw_from__Account -url /path/to/graph-book/data/ch5/withdraw_from.csv -header true -schema.allowMissingFields true
./dsbulk load -k neighborhoods_prod -t Transaction__pay__Loan -url /path/to/graph-book/data/ch5/pay_loan.csv -header true -schema.allowMissingFields true
./dsbulk load -k neighborhoods_prod -t Transaction__pay__Vendor -url /path/to/graph-book/data/ch5/pay_vendor.csv -header true -schema.allowMissingFields true

echo "Completed loading edges into the graph neighborhoods_prod."

cd /path/to/graph-book/data/ch5
