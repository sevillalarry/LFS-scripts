# b.6.14.Sed-4.8.sh
#

export PKG="sed-4.8"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
./configure --prefix=/usr   \
            --host=$LFS_TGT && \
\
make && \
\
make DESTDIR=$LFS install \
\
; }

cd ..
rm -rf $PKG
unset PKG
