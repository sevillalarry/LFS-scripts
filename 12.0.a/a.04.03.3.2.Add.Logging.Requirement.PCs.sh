# a.04.03.3.2.Add.Logging.Requirement.PCs.sh
#

mkdir -pv $LFS/var/log/lfs
chmod -v a+wt $LFS/var/log/lfs
chown -v lfs:lfs $LFS/var/log/lfs
