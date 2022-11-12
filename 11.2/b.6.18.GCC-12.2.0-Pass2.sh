# b.6.18.GCC-12.2.0-Pass2.sh
#

export PKG="gcc-12.2.0"
export PKGLOG_DIR=$LFSLOG/5.03
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log

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
    sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64
  ;;
esac    && \
\
sed '/thread_header =/s/@.*@/gthr-posix.h/' \
    -i libgcc/Makefile.in libstdc++-v3/include/Makefile.in    && \
\
mkdir -v build  && \
cd       build  && \
\
echo "2. Configure ..."   && \
../configure                                  \
    --build=$(../config.guess)                \
    --host=$LFS_TGT                           \
    --target=$LFS_TGT                         \
    LDFLAGS_FOR_TARGET=-L$PWD/$LFS_TGT/libgcc \
    --prefix=/usr                             \
    --with-build-sysroot=$LFS                 \
    --enable-initfini-array                   \
    --disable-nls                             \
    --disable-multilib                        \
    --disable-decimal-float                   \
    --disable-libatomic                       \
    --disable-libgomp                         \
    --disable-libquadmath                     \
    --disable-libssp                          \
    --disable-libvtv                          \
    --enable-languages=c,c++                  \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR  && \
\
echo "3. Make Build ..."                && \
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR  && \
\
echo "4. Make Install ..."              && \
make DESTDIR=$LFS install     \
  > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR   && \
\
ln -sv gcc $LFS/usr/bin/cc  \
\
; }

cd ..
cd ..
rm -rf $PKG
unset PKGLOG_ERROR PKGLOG_INSTALL
unset PKGLOG_BUILD PKGLOG_CONFIG PKGLOG_TAR
unset PKGLOG_DIR PKG
