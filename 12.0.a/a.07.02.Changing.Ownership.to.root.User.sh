# a.04.03.2.Change.Ownership.to.LFS.User.sh
#

chown -R root:root $LFS/{usr,lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) chown -R root:root $LFS/lib64 ;;
esac

chown -v root:root $LFS/sources
chown -v root:root $LFS/sources/*
