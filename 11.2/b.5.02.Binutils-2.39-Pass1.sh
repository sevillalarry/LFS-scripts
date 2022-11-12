# b.5.02.Binutils-2.39-Pass1.sh
#

export PKG="binutils-2.39"
export PKGLOG_DIR=$LFSLOG/5.02
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log

mkdir -v $PKGLOG_DIR

echo "1. Extract tar..."
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2> $PKGLOG_ERROR
cd $PKG

time { \
\
mkdir -v build && \
cd       build && \
\
echo "2. Configure ..."         && \
../configure --prefix=$LFS/tools    \
             --with-sysroot=$LFS    \
             --target=$LFS_TGT      \
             --disable-nls          \
             --enable-gprofng=no    \
             --disable-werror       \
             > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR && \
\
echo "3. Make Build ..."                        && \
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR          && \
\
echo "4. Make Install ..."                      && \
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR    \
\
; }

cd ..
cd ..
rm -rf $PKG
unset PKGLOG_ERROR PKGLOG_INSTALL
unset PKGLOG_BUILD PKGLOG_CONFIG PKGLOG_TAR
unset PKGLOG_DIR PKG
