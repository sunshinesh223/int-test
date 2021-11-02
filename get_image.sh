#!/bin/bash


img_id=$(packer build builder.json|sed -nr "s/.*ID: ([0-9]+).*/\1/p")
echo "get img_id as $img_id"
