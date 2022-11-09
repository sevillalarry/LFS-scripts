# b.6.02.M4-1.4.19.sh
#

export PKG="m4-1.4.19"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)  && \
\
make && \
\
make DESTDIR=$LFS install \
\
; }

cd ..
rm -rf $PKG
unset PKG
