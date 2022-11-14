# b.5.05.Glibc-2.36.sh
#

export PKG="glibc-2.36"
export PKGLOG_DIR=$LFSLOG/5.05
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log

mkdir $PKGLOG_DIR

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
     > $PKGLOG_CHECK 2>> $PKGLOG_ERROR
readelf -l a.out | grep ld-linux            \
    >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
rm -v a.out

cd ..
cd ..
rm -rf $PKG
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
