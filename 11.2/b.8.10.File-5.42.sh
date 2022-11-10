# b.8.10.File-5.42.sh
#

export PKG="file-5.42"
tar xvf $PKG.tar.gz
cd $PKG

time { \
\
./configure --prefix=/usr   && \
\
make            && \
\
make check      && \
\
make install       \
\
; }

cd ..
rm -rf $PKG
unset PKG
