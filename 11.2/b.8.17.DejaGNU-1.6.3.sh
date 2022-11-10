# b.8.17.DejaGNU-1.6.3.sh
#

export PKG="dejagnu-1.6.3"
tar xvf $PKG.tar.gz
cd $PKG

time { \
\
mkdir -v build  && \
cd       build  && \
\
../configure --prefix=/usr  && \
makeinfo --html --no-split -o doc/dejagnu.html ../doc/dejagnu.texi  && \
makeinfo --plaintext       -o doc/dejagnu.txt  ../doc/dejagnu.texi  && \
\
make install    && \
install -v -dm755  /usr/share/doc/dejagnu-1.6.3     && \
install -v -m644   doc/dejagnu.{html,txt} /usr/share/doc/dejagnu-1.6.3  && \
\
make check  \
\
; }

cd ..
cd ..
rm -rf $PKG
unset PKG
