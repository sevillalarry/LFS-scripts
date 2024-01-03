# a.04.04.Setting.Up.the.Environment.sh
#
# Note: change the MAKEFLAGS based on the number of threads
#

cat > ~/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF

cat > ~/.bashrc << "EOF"
set +h
umask 022
LFS=/mnt/lfs
LFSLOG=/mnt/lfs/var/log/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
MAKEFLAGS="-j8"
NPROC="8"
PATH=/usr/bin
if [ ! -L /bin ]; then PATH=/bin:$PATH; fi
PATH=$LFS/tools/bin:$PATH
CONFIG_SITE=$LFS/usr/share/config.site
export LFS LFSLOG LC_ALL LFS_TGT MAKEFLAGS NPROC PATH CONFIG_SITE
EOF
