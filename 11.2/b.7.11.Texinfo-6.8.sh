# b.7.11.Texinfo-6.8.sh
#

export PKG="texinfo-6.8"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
./configure --prefix=/usr   && \
\
make && \
\
make install \
\
; }

cd ..
rm -rf $PKG
unset PKG
