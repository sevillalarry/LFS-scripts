# a.04.03.3.1.Add.Logging.Requirement.VMs.sh
#

mkdir -pv $LFS/var/log
chown -v lfs:lfs $LFS/var/log
chown -v lfs:lfs $LFS/mnt/src/lfs.log
ln -sfv $LFS/mnt/src/lfs.log $LFS/var/log/lfs
