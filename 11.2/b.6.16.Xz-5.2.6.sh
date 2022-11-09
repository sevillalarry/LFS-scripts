# b.6.16.Xz-5.2.6.sh
#

export PKG="xz-5.2.6"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.2.6 && \
\
make && \
\
make DESTDIR=$LFS install   && \
\
rm -v $LFS/usr/lib/liblzma.la \
; }

cd ..
rm -rf $PKG
unset PKG
