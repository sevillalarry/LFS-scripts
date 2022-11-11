# b.6.17.Binutils-2.39.sh
#

export PKG="binutils-2.39"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
mkdir -v build  && \
cd       build  && \
\
../configure --prefix=/usr       \
             --sysconfdir=/etc   \
             --enable-gold       \
             --enable-ld=default \
             --enable-plugins    \
             --enable-shared     \
             --disable-werror    \
             --enable-64-bit-bfd \
             --with-system-zlib && \
\
make tooldir=/usr   && \
\
make -k check       && \
\
make tooldir=/usr install   && \
\
rm -fv /usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes}.a    \
\
; }

cd ..
cd ..
rm -rf $PKG
unset PKG
