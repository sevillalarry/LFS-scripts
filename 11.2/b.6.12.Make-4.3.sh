# b.6.12.Make-4.3.sh
#

export PKG="make-4.3"
tar xvf $PKG.tar.gz
cd $PKG

time { \
\
./configure --prefix=/usr   \
            --without-guile \
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
