# b.8.19.GMP-6.2.1.sh
#

export PKG="gmp-6.2.1"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
./configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=/usr/share/doc/gmp-6.2.1   && \
\
make            && \
make html       && \
\
make check 2>&1 | tee gmp-check-log     && \
\
make check 2>&1 | tee gmp-check-log     && \
\
make install        && \
make install-html   \
\
; }

cd ..
rm -rf $PKG
unset PKG
