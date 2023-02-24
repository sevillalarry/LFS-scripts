# b.5.06.Libstdc++.from.GCC-12.2.0.sh
#

export PKG="gcc-12.2.0"
export PKGLOG_DIR=$LFSLOG/5.06
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2> $PKGLOG_ERROR
cd $PKG

time { \
\
mkdir -v build      && \
cd       build      && \
\
echo "2. Configure ..."         && \
../libstdc++-v3/configure           \
    --host=$LFS_TGT                 \
    --build=$(../config.guess)      \
    --prefix=/usr                   \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/12.2.0   \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR  && \
\
echo "3. Make Build ..."                        && \
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR          && \
\
echo "4. Make Install ..."                      && \
make DESTDIR=$LFS install   \
    > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR         && \
\
rm -v $LFS/usr/lib/lib{stdc++,stdc++fs,supc++}.la \
\
; }

cd ..
cd ..
rm -rf $PKG
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG 
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
