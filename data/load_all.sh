#!/bin/bash

# You may set the following variables inside script, or override corresponding
# variables when running the script

while true; do
    read -p "Did you already perform the set up steps?
    (1) Import each chapter notebook into DataStax Studio
    (1) Create each graph and graph's schema via the chapter's notebook and
    (3) Update the DEFAULT_DSBULK_PATH within each chapter's loading file.
        ----> Helper Tip: you will find this at the top of each chx_load.sh file inside each chapter directory.
    Please input y or n: " yn
    case $yn in
        [Nn]* ) echo "Please follow the three steps above and then come back to data loading.
You can also just load each chapter individually as you go through the text. Thanks!"; exit;;
        [Yy]* ) ### load ch 4
                echo "
------------ Loading the data for Chapter 4 ------------ >
"
                cd ch4
                ./ch4_load.sh
                cd ..

               ## load ch 5
               echo "
------------ Loading the data for Chapter 5 ------------ >
"
               cd ch5
               ./ch5_load.sh
               cd ..
               ## load ch 6
               echo "
------------ Loading the data for Chapter 6 ------------ >
"
               cd ch6
               ./ch6_load.sh
               cd ..
               ## load ch 7
               echo "
------------ Loading the data for Chapter 7 ------------ >
"
               cd ch7
               ./ch7_load.sh
               cd ..
               ##load ch 8
               echo "
------------ Loading the data for Chapter 8 ------------ >
"
               cd ch8
               ./ch8_load.sh
               cd ..
               ##load ch 9
               echo "
------------ Loading the data for Chapter 9 ------------ >
"
               cd ch9
               ./ch9_load.sh
               cd ..
               ##load ch 10
               echo "
------------ Loading the data for Chapter 10 ------------ >
"
               cd ch10
               ./ch10_load.sh
               cd ..
               ##load ch 12
               echo "
------------ Loading the data for Chapter 12 ------------ >
"
               cd ch12
               ./ch12_load_shortcut_example.sh
               #./ch12_load_production.sh
               cd ..
               echo "
NOTE: In Chapter 12, you will drop your data, make a new schema, and load the final production dataset with ch12/ch12_load_production.sh

Data Loading successfully completed.
Enjoy!"
                break;;
        * ) echo "Please answer yes or no.
Acceptable responses are y, Y, n, or N.";;
    esac
done