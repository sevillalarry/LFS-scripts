# b.6.11.Gzip-1.12.sh
#

export PKG="gzip-1.12"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
./configure --prefix=/usr --host=$LFS_TGT && \
\
make && \
\
make DESTDIR=$LFS install \
\
; }

cd ..
rm -rf $PKG
unset PKG
