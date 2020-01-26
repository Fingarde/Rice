echo "Type username"
read username

apt-get install -y sudo
sudo adduser "$username" sudo