#version=DEVEL
# System authorization information
auth --enableshadow --passalgo=sha512
# Use graphical install
graphical
# Run the Setup Agent on first boot
firstboot --enable
ignoredisk --only-use=sda
# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'
# System language
lang en_US.UTF-8

# Network information
network  --bootproto=dhcp --device=enp0s3 --ipv6=auto --activate
network  --hostname=localhost.localdomain

# Use network installation
url --url="http://mirror.centos.org/centos/7/os/x86_64" --proxy="http://192.168.7.2:3128"
# Root password
rootpw --iscrypted $6$TUgho33nIAFdFadM$4GKBrZj3hkHNflziL650qOV2.eq7u6bA7Rk1WzqTrVtl8.cmTfhmZgEnZhp0jAmzugSvt4OgkGVUt3JF1bjL9.
# System services
services --enabled="chronyd"
# System timezone
timezone America/New_York --isUtc
user --groups=wheel --name=dkaushal --password=$6$POcecRmumtdyonNd$RUGDMq91Z40btlQcx.O44TqKVZsuJzjKhofI5ZE5QKVzyXKrR0AgDV.RJGXV8HwRY3GmkYlr30OiedZ6eFDVU/ --iscrypted --gecos="Deepika Kaushal"
# System bootloader configuration
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=sda
autopart --type=lvm
# Partition clearing information
clearpart --all --initlabel --drives=sda

%packages
@^minimal
@core
chrony
kexec-tools

%end

%addon com_redhat_kdump --enable --reserve-mb='auto'

%end

%anaconda
pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty
%end
