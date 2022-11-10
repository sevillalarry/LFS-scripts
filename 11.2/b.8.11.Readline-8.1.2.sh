# b.8.11.Readline-8.1.2.sh
#

export PKG="readline-8.1.2"
tar xvf $PKG.tar.gz
cd $PKG

time { \
\
sed -i '/MV.*old/d' Makefile.in                 && \
sed -i '/{OLDSUFF}/c:' support/shlib-install    && \
\
./configure --prefix=/usr    \
            --disable-static \
            --with-curses    \
            --docdir=/usr/share/doc/readline-8.1.2  && \
\
make SHLIB_LIBS="-lncursesw"            && \
\
make SHLIB_LIBS="-lncursesw" install    && \
\
install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-8.1.2  \
\
; }

cd ..
rm -rf $PKG
unset PKG
