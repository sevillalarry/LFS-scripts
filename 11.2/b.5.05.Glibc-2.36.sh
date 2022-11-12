# b.5.05.Glibc-2.36.sh
#

export LOG="5.05.Glibc-2.36"
export PKG="glibc-2.36"
export PKGLOG_TAR=$LFSLOG_TAR/$LOG
export PKGLOG_CONFIG=$LFSLOG_CONFIG/$LOG
export PKGLOG_BUILD=$LFSLOG_BUILD/$LOG
export PKGLOG_INSTALL=$LFSLOG_INSTALL/$LOG
export PKGLOG_CHECK=$LFSLOG_CHECK/$LOG
export PKGLOG_ERROR=$LFSLOG_ERROR/$LOG

echo "1. Extract tar..."
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2> $PKGLOG_ERROR
cd $PKG

time { \
\
case $(uname -m) in
    i?86)   ln -sfv ld-linux.so.2 $LFS/lib/ld-lsb.so.3
    ;;
    x86_64) ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64
            ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so.3
    ;;
esac                                        && \
\
patch -Np1 -i ../glibc-2.36-fhs-1.patch     && \
\
mkdir -v build                              && \
cd       build                              && \
\
echo "rootsbindir=/usr/sbin" > configparms  && \
\
echo "2. Configure ..."                 && \
../configure                                \
      --prefix=/usr                         \
      --host=$LFS_TGT                       \
      --build=$(../scripts/config.guess)    \
      --enable-kernel=3.2                   \
      --with-headers=$LFS/usr/include       \
      libc_cv_slibdir=/usr/lib              \
        > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR && \
\
export OLD_MAKEFLAGS=$MAKEFLAGS     && \
export MAKEFLAGS="-j1"              && \
\
echo "3. Make Build ..."                    && \
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR      && \
\
echo "4. Make Install ..."                  && \
make DESTDIR=$LFS install   \
    > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR     && \
\
sed '/RTLDLIST=/s@/usr@@g' -i $LFS/usr/bin/ldd                  && \
\
$LFS/tools/libexec/gcc/$LFS_TGT/12.2.0/install-tools/mkheaders  && \
\
export MAKEFLAGS=$OLD_MAKEFLAGS                                 && \
unset OLD_MAKEFLAGS                                             \
\
; }

echo 'int main(){}' | $LFS_TGT-gcc -xc -    \

readelf -l a.out | grep ld-linux
rm -v a.out

cd ..
cd ..
rm -rf $PKG
unset PKGLOG_ERROR PKGLOG_INSTALL
unset PKGLOG_BUILD PKGLOG_CONFIG PKGLOG_TAR
unset PKG LOG
