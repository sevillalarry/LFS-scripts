# b.8.22.Attr-2.5.1.sh
#

export PKG="attr-2.5.1"
tar xvf $PKG.tar.gz
cd $PKG

time { \
\
./configure --prefix=/usr     \
            --disable-static  \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/attr-2.5.1  && \
\
make            && \
\
make check      && \
\
make install    \
\
; }

cd ..
rm -rf $PKG
unset PKG
