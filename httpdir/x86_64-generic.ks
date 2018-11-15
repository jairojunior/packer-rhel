lang en_US
keyboard us
timezone America/Fortaleza --isUtc
reboot
text
cdrom
rootpw $1$sLhCeYXU$wVc39u5N4XRpfeO96Q9v90 --iscrypted
bootloader --location=mbr --append="rhgb quiet crashkernel=auto"
zerombr
clearpart --all --initlabel --drives=vda
part /boot --fstype=ext4 --size=250
volgroup vg_local pv.0 
part pv.0 --fstype=lvmpv --ondisk=vda --size=1024 --grow
logvol swap --recommended --vgname=vg_local --name=lv_swap
logvol / --vgname=vg_local --name=lv_root --fstype=xfs --size=20480
auth --passalgo=sha512 --useshadow
selinux --enforcing
firewall --enabled
skipx
%packages
cloud-init
%end
%post
touch /etc/cloud/cloud-init.disabled
%end