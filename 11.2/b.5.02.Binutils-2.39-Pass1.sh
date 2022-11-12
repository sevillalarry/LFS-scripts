# b.5.02.Binutils-2.39-Pass1.sh
#

export LOG="5.02.Binutils-2.39-Pass1"
export PKG="binutils-2.39"
export PKGLOG_CONFIG=$LFSLOG_CONFIG/$LOG
export PKGLOG_BUILD=$LFSLOG_BUILD/$LOG
export PKGLOG_INSTALL=$LFSLOG_INSTALL/$LOG
export PKGLOG_ERROR=$LFSLOG_ERROR/$LOG
export PKGLOG_TIME=$LFSLOG_TIME/$LOG

tar xvf $PKG.tar.xz
cd $PKG

time { \
\
mkdir -v build && \
cd       build && \
\
../configure --prefix=$LFS/tools    \
             --with-sysroot=$LFS    \
             --target=$LFS_TGT      \
             --disable-nls          \
             --enable-gprofng=no    \
             --disable-werror       \
             > $PKGLOG_CONFIG 2> $PKGLOG_ERROR  && \
\
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR  &&   \
\
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR  \
\
; } > $PKGLOG_TIME 2>> $PKGLOG_ERROR

cd ..
cd ..
rm -rf $PKG
unset PKG
