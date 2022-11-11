# b.6.17.Binutils-2.39-Pass2.sh
#

export PKG="binutils-2.39"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
sed '6009s/$add_dir//' -i ltmain.sh       && \
\
mkdir -v build  && \
cd       build  && \
\
../configure                   \
    --prefix=/usr              \
    --build=$(../config.guess) \
    --host=$LFS_TGT            \
    --disable-nls              \
    --enable-shared            \
    --enable-gprofng=no        \
    --disable-werror           \
    --enable-64-bit-bfd     && \
\
make && \
\
make DESTDIR=$LFS install   && \
\
rm -v $LFS/usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes}.{a,la}  \
\
; }

cd ..
cd ..
rm -rf $PKG
unset PKG
