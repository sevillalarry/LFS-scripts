# b.8.13.Bc-6.0.1.sh
#

export PKG="bc-6.0.1"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
CC=gcc ./configure --prefix=/usr -G -O3 -r  && \
\
make            && \
\
make test       && \
\
make install       \
\
; }

cd ..
rm -rf $PKG
unset PKG
