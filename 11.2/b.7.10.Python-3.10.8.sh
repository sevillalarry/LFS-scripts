# b.7.10.Python-3.10.8.sh
#

# (based on Errata use: )
export PKG="Python-3.10.8"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip     && \
\
make && \
\
make install  \
\
; }

cd ..
rm -rf $PKG
unset PKG
