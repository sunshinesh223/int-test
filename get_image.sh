#!/bin/bash


packer build builder.json> build.log
img_id=$(cat build.log|sed -nr "s/.*ID: ([0-9]+).*/\1/p")
echo "$img_id" > img_id.txt
