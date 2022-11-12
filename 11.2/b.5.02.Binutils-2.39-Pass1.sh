# b.5.02.Binutils-2.39-Pass1.sh
#

export LOG="5.02.Binutils-2.39-Pass1"
export PKG="binutils-2.39"
export PKGLOG_TAR=$LFSLOG_TAR/$LOG
export PKGLOG_CONFIG=$LFSLOG_CONFIG/$LOG
export PKGLOG_BUILD=$LFSLOG_BUILD/$LOG
export PKGLOG_INSTALL=$LFSLOG_INSTALL/$LOG
export PKGLOG_ERROR=$LFSLOG_ERROR/$LOG
export PKGLOG_TIME=$LFSLOG_TIME/$LOG

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
; } > $PKGLOG_TIME 2>> $PKGLOG_ERROR

cd ..
cd ..
rm -rf $PKG
unset PKGLOG_TIME PKGLOG_ERROR PKGLOG_INSTALL
unset PKGLOG_BUILD PKGLOG_CONFIG PKGLOG_TAR
unset PKG LOG
