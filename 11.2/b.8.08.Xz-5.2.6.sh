# b.8.08.Xz-5.2.6.sh
#

export PKG="xz-5.2.6"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/xz-5.2.6   && \
\
make            && \
\
make check      && \
\
make install       \
\
; }

cd ..
rm -rf $PKG
unset PKG
