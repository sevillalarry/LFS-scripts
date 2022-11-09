# b.6.06.Diffutils-3.8.sh
#

export PKG="diffutils-3.8"
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
