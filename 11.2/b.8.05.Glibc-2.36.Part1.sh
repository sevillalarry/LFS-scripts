# b.8.05.Glibc-2.36.Part1.sh
#

export PKG="glibc-2.36"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
patch -Np1 -i ../glibc-2.36-fhs-1.patch     && \
\
mkdir -v build                              && \
cd       build                              && \
\
echo "rootsbindir=/usr/sbin" > configparms  && \
\
../configure --prefix=/usr                    \
             --disable-werror                 \
             --enable-kernel=3.2              \
             --enable-stack-protector=strong  \
             --with-headers=/usr/include      \
             libc_cv_slibdir=/usr/lib       && \
\
make \
\
; }

cd ..
cd ..
#rm -rf $PKG
unset PKG
