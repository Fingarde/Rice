apt-get -y remove nvidia*
apt-get -y autoremove

apt-get update
apt-get install -y dkms build-essential linux-headers-$(uname -r)

dpkg --add-architecture i386
apt-get update
apt-get install -y lib32z1 lib32ncurses5
apt-get update

echo "blacklist nouveau
blacklist lbm-nouveau
options nouveau modeset=0
alias nouveau off
alias lbm-nouveau off" > /etc/modprobe.d/blacklist-nouveau.conf

echo options nouveau modeset=0 | tee -a /etc/modprobe.d/nouveau-kms.conf
update-initramfs -u

sudo apt-get install -y nvidia-driver