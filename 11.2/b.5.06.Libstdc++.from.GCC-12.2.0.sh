# b.5.06.Libstdc++.from.GCC-12.2.0.sh
#

export PKG="gcc-12.2.0"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
mkdir -v build      && \
cd       build      && \
\
../libstdc++-v3/configure           \
    --host=$LFS_TGT                 \
    --build=$(../config.guess)      \
    --prefix=/usr                   \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/12.2.0  && \
\
make                        && \
\
make DESTDIR=$LFS install   && \
\
rm -v $LFS/usr/lib/lib{stdc++,stdc++fs,supc++}.la \
\
; }

cd ..
cd ..
rm -rf $PKG
unset PKG
