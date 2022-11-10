# b.8.16.Expect-5.45.4.sh
#

export PKG="expect-5.45.4"
tar xvf $PKG.tar.gz
cd $PKG

time { \
\
./configure --prefix=/usr           \
            --with-tcl=/usr/lib     \
            --enable-shared         \
            --mandir=/usr/share/man \
            --with-tclinclude=/usr/include  && \
\
make            && \
\
make test       && \
\
make install    && \
ln -svf expect5.45.4/libexpect5.45.4.so /usr/lib    \
\
; }

cd ..
rm -rf $PKG
unset PKG
