# b.7.08.Bison-3.8.2.sh
#

export PKG="bison-3.8.2"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
./configure --prefix=/usr \
            --docdir=/usr/share/doc/bison-3.8.2     && \
\
make && \
\
make install \
\
; }

cd ..
rm -rf $PKG
unset PKG
