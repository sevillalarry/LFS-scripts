# b.8.03.Man-pages-5.13.sh
#

export PKG="man-pages-5.13"
export PKGLOG_DIR=$LFSLOG/8.03
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
#export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log

mkdir $PKGLOG_DIR

echo "1. Extract tar..."
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2> $PKGLOG_ERROR
cd $PKG

time { \
\
echo "2. Make Install ..."              && \
make prefix=/usr install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR    \
\
; }

cd ..
rm -rf $PKG
unset PKGLOG_ERROR PKGLOG_INSTALL
#unset PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_TAR
unset PKGLOG_DIR PKG
