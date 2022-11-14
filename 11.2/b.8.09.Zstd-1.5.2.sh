# b.8.09.Zstd-1.5.2.sh
#

export PKG="zstd-1.5.2"
export PKGLOG_DIR=$LFSLOG/8.09
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log

mkdir $PKGLOG_DIR

echo "1. Extract tar..."
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2> $PKGLOG_ERROR
cd $PKG

time { \
\
patch -Np1 -i ../zstd-1.5.2-upstream_fixes-1.patch  && \
\
echo "2. Make Build ..."                && \
make PREFIX=/usr    \
    > $PKGLOG_BUILD 2>> $PKGLOG_ERROR   && \
\
echo "3. Make Check ..."                && \
make check  \
    > $PKGLOG_CHECK 2>> $PKGLOG_ERROR   && \
\
echo "4. Make Install ..."              && \
make PREFIX=/usr install    \
    > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR && \
\
rm -v /usr/lib/libzstd.a    \
\
; }

cd ..
rm -rf $PKG
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD
# PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
