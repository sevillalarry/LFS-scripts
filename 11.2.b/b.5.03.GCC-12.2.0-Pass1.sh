# b.5.03.GCC-12.2.0-Pass1.sh
#

export PKG="gcc-12.2.0"
export PKGLOG_DIR=$LFSLOG/5.03
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1.0 Extract tar GCC..."
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2> $PKGLOG_ERROR
cd $PKG

time { \
\
echo "1.1 Extract tar MPFR ." && \
tar -xf ../mpfr-4.1.0.tar.xz  >> $PKGLOG_TAR 2>> $PKGLOG_ERROR  && \
mv -v mpfr-4.1.0 mpfr         && \
echo "1.2 Extract tar GMP ."  && \
tar -xf ../gmp-6.2.1.tar.xz   >> $PKGLOG_TAR 2>> $PKGLOG_ERROR  && \
mv -v gmp-6.2.1 gmp           && \
echo "1.3 Extract tar MPC ."  && \
tar -xf ../mpc-1.2.1.tar.gz   >> $PKGLOG_TAR 2>> $PKGLOG_ERROR  && \
mv -v mpc-1.2.1 mpc           && \
\
case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
 ;;
esac    && \
\
mkdir -v build && \
cd       build && \
\
echo "2. Configure ..."   && \
../configure                  \
    --target=$LFS_TGT         \
    --prefix=$LFS/tools       \
    --with-glibc-version=2.36 \
    --with-sysroot=$LFS       \
    --with-newlib             \
    --without-headers         \
    --disable-nls             \
    --disable-shared          \
    --disable-multilib        \
    --disable-decimal-float   \
    --disable-threads         \
    --disable-libatomic       \
    --disable-libgomp         \
    --disable-libquadmath     \
    --disable-libssp          \
    --disable-libvtv          \
    --disable-libstdcxx       \
    --enable-languages=c,c++  \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR  && \
\
echo "3. Make Build ..."                && \
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR  && \
\
echo "4. Make Install ..."                        && \
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR  && \
\
cd ..        && \
cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
  `dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/install-tools/include/limits.h \
\
; }

cd ..
rm -rf $PKG
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
