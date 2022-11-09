# b.6.09.Gawk-5.1.1.sh
#

export PKG="gawk-5.1.1"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
sed -i 's/extras//' Makefile.in   && \
\
./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess) && \
\
make && \
\
make DESTDIR=$LFS install \
\
; }

cd ..
rm -rf $PKG
unset PKG
