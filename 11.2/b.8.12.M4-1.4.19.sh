# b.8.12.M4-1.4.19.sh
#

export PKG="m4-1.4.19"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
./configure --prefix=/usr   && \
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
