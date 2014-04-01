# Base install

sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

cat > /etc/yum.repos.d/epel.repo << EOM
[epel]
name=epel
baseurl=http://download.fedoraproject.org/pub/epel/6/\$basearch
enabled=1
gpgcheck=0
EOM

# Register the system with rhn
/usr/bin/subscription-manager register --username= --password=''
/usr/bin/subscription-manager attach --auto

# Ensure the optional repo is enabled - required for puppet
subscription-manager repos --enable=rhel-6-server-optional-rpms

yum -y install gcc make gcc-c++ kernel-devel-`uname -r` zlib-devel openssl-devel readline-devel sqlite-devel perl wget dkms nfs-utils
