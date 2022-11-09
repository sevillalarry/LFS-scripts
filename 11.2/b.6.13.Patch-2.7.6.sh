# b.6.13.Patch-2.7.6.sh
#

export PKG="patch-2.7.6"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess) && \
\
make && \
\
make DESTDIR=$LFS install \
\
; }

cd ..
rm -rf $PKG
unset PKG
