# a.05.03.GCC-13.2.0-Pass1.sh
#

export PKG="gcc-13.2.0"
export PKGLOG_DIR=$LFSLOG/05.03
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1.0 Extract tar GCC..."
echo "1.0 Extract tar GCC..." >> $LFSLOG_PROCESS
echo "1.0 Extract tar GCC..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG



echo "1.1 Extract tar MPFR ."
echo "1.1 Extract tar MPFR ." >> $LFSLOG_PROCESS
echo "1.1 Extract tar MPFR ." >> $PKGLOG_ERROR
tar -xf ../mpfr-4.2.0.tar.xz  >> $PKGLOG_TAR 2>> $PKGLOG_ERROR
mv mpfr-4.2.0 mpfr
echo "1.2 Extract tar GMP ."
echo "1.2 Extract tar GMP ." >> $LFSLOG_PROCESS
echo "1.2 Extract tar GMP ." >> $PKGLOG_ERROR
tar -xf ../gmp-6.3.0.tar.xz   >> $PKGLOG_TAR 2>> $PKGLOG_ERROR
mv gmp-6.3.0 gmp
echo "1.3 Extract tar MPC ."
echo "1.3 Extract tar MPC ." >> $LFSLOG_PROCESS
echo "1.3 Extract tar MPC ." >> $PKGLOG_ERROR
tar -xf ../mpc-1.3.1.tar.gz   >> $PKGLOG_TAR 2>> $PKGLOG_ERROR
mv mpc-1.3.1 mpc

echo "Default directory for 64-bit lib" >> $PKGLOG_OTHERS
case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
 ;;
esac >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mkdir build
cd    build

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
../configure                  \
    --target=$LFS_TGT         \
    --prefix=$LFS/tools       \
    --with-glibc-version=2.38 \
    --with-sysroot=$LFS       \
    --with-newlib             \
    --without-headers         \
    --enable-default-pie      \
    --enable-default-ssp      \
    --disable-nls             \
    --disable-shared          \
    --disable-multilib        \
    --disable-threads         \
    --disable-libatomic       \
    --disable-libgomp         \
    --disable-libquadmath     \
    --disable-libssp          \
    --disable-libvtv          \
    --disable-libstdcxx       \
    --enable-languages=c,c++  \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

cd ..
cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
  `dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/include/limits.h


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
