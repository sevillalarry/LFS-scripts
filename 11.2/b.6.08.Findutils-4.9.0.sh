# b.6.08.Findutils-4.9.0.sh
#

export PKG="findutils-4.9.0"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
./configure --prefix=/usr                   \
            --localstatedir=/var/lib/locate \
            --host=$LFS_TGT                 \
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
