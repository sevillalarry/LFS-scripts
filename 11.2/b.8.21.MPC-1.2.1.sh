# b.8.21.MPC-1.2.1.sh
#

export PKG="mpc-1.2.1"
tar xvf $PKG.tar.gz
cd $PKG

time { \
\
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/mpc-1.2.1   && \
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
