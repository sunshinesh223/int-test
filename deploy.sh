
KeyName=guang-pub

# get ssh-key id
ssh_pub_id=$(doctl compute ssh-key list|grep $KeyName|awk '{ print $1 }')
# get image id
img_id=$(cat img_id.txt)

#create droplet
dropet_info=$(doctl compute droplet create --image $img_id --size s-1vcpu-1gb --ssh-keys $ssh_pub_id --region ams3 $RANDOM.int-test.com|grep -v ID|awk '{ print $1,$2 }')
dropet_id=$(echo $dropet_info|awk '{ print $1}')
dropet_name=$(echo $dropet_info|awk '{ print $2}')
while true; then
	dropet_ip=$(doctl compute droplet get $dropet_id|grep -v ID|awk '{ print $3 }'|grep .)
	if [ $? eq 0 ]; then
		break
	fi
done
# save the new droplet for ansible inventory
echo "$dropet_name=$dropet_ip" >>inventory

