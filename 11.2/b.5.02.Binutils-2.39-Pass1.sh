# b.5.02.Binutils-2.39-Pass1.sh
#

export PKG="binutils-2.39"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
mkdir -v build && \
cd       build && \
\
../configure --prefix=$LFS/tools \
             --with-sysroot=$LFS \
             --target=$LFS_TGT   \
             --disable-nls       \
             --enable-gprofng=no \
             --disable-werror && \
\
make &&      \
\
make install \
\
; }

cd ..
cd ..
rm -rf $PKG
unset PKG
