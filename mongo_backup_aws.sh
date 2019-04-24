#!/bin/bash

# THIS VERSION WILL ASK YOU FOR THE DATABASE NAME AND WHERE TO SAVE IT LOCALLY

function show_usage {
    echo "Usage: $0 database-name save-directory"
    exit 1
}

#Need two parameters
if [ $# -ne 2 ]; then
    echo "Two parameters required"
    show_usage;
fi

#Second parameter must be a valid directory
if [ ! -d $2 ]; then
    echo "Save directory (parameter 2) is invalid"
    show_usage
fi


database=$1
save_dir=$2
file_name="${database}-`date +%Y%m%d%H%M`.mongo.gz"

mkdir -p ${save_dir}/mongo

mongodump -h 00.00.00.00 -u your_username -p 'your_password' -o ${save_dir}/mongo

if [ -e ${save_dir}/mongo ]; then
    echo "Local backup created"

    tar -cvjf ${file_name} ${save_dir}/mongo

    S3BUCKET="clab_backups"
    /usr/bin/s3cmd --config /path/to/.s3cfg put ${file_name} s3://${S3BUCKET}/${file_name}
    sleep 5
    rm ${file_name}
    rm -rf ${save_dir}/mongo
    echo "Updated to s3"

fi
