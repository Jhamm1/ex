#!/bin/sh

ls

read -p 'How many docker containers do you want to spin up: ' input

function BuildContainers(){

    NOW=$(date +"%d-%m-%Y")
    NOW2=$(date +"%H-%M-%S")


    #read -p 'How many docker containers do you want to spin up: ' input

    docker --version

    #docker build -t drjay-app_"$NOW.$NOW2" .

    echo "$input -- $NOW.$NOW2"


    # func
    count=1
    while [ $count -le $input ]
    do
    #echo "drjay-app_$count"
    docker build -t drjay-app_$count .
    (( count++ ))
    done
}

#Sleep
#sleep 60

BuildContainers

function Runontainers(){

    NOW=$(date +"%d-%m-%Y")
    NOW2=$(date +"%H-%M-%S")


    

    docker --version

    #docker build -t drjay-app_"$NOW.$NOW2" .

    echo "$input -- $NOW.$NOW2"


    # func
    count=1
    while [ $count -le $input ]
    do
    echo "drjay-app_$count"
    #docker build -t drjay-app_$count .
    (( count++ ))
    done
}

Runontainers