
KeyName=guang-pub

# get ssh-key id
ssh_pub_id=$(doctl compute ssh-key list|grep $KeyName|awk '{ print $1 }')
# get image id
img_id=$(cat img_id.txt)

#create droplet
doctl compute droplet create --image $img_id --size s-1vcpu-1gb --ssh-keys $ssh_pub_id --region ams3 test.com
