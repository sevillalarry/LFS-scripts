# b.6.15.Tar-1.34.sh
#

export PKG="tar-1.34"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
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
