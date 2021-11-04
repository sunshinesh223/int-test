#!/bin/bash
echo "deleting all the droplets"
for i in $(doctl compute droplet list|grep -v Name|awk '{ print $1}');do doctl compute droplet delete $i -f;done
echo "deleting all the images"
for i in $(doctl compute image list|grep -v Name|awk '{ print $1}');do doctl compute image delete $i -f;done
echo "verifying droplets list"
doctl compute droplet list
echo "verifying image list"
doctl compute image list

