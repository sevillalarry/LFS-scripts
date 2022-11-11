# b.8.05.Glibc-2.36.Part2.sh
#

export PKG="glibc-2.36"
#tar xvf $PKG.tar.xz
cd $PKG

time { \
\
cd build && \
\
make check  \
\
; }

cd ..
cd ..
#rm -rf $PKG
unset PKG
