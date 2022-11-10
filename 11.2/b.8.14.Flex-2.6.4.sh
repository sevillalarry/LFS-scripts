# b.8.14.Flex-2.6.4.sh
#

export PKG="flex-2.6.4"
tar xvf $PKG.tar.gz
cd $PKG

time { \
\
./configure --prefix=/usr \
            --docdir=/usr/share/doc/flex-2.6.4 \
            --disable-static    && \
\
make            && \
\
make check      && \
\
make install    && \
\
ln -sv flex /usr/bin/lex    \
\
; }

cd ..
rm -rf $PKG
unset PKG
