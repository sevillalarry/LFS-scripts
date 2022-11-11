# b.8.20.MPFR-4.1.0.sh
#

export PKG="mpfr-4.1.0"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
./configure --prefix=/usr        \
            --disable-static     \
            --enable-thread-safe \
            --docdir=/usr/share/doc/mpfr-4.1.0  && \
\
make            && \
make html       && \
\
make check      && \
\
make install    && \
make install-html   \
\
; }

cd ..
rm -rf $PKG
unset PKG
