# b.8.06.Zlib-1.2.13.sh
#

export PKG="zlib-1.2.13"
tar xvf $PKG.tar.gz
cd $PKG

time { \
\
./configure --prefix=/usr && \
\
make          && \
\
make check    && \
\
make install  && \
\
rm -fv /usr/lib/libz.a  \
\
; }

cd ..
rm -rf $PKG
unset PKG
