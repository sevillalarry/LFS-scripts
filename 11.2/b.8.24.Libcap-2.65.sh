# b.8.24.Libcap-2.65.sh
#

export PKG="libcap-2.65"
export PKGLOG_DIR=$LFSLOG/8.24
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log

mkdir $PKGLOG_DIR

echo "1. Extract tar..."
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2> $PKGLOG_ERROR
cd $PKG

time { \
\
sed -i '/install -m.*STA/d' libcap/Makefile     && \
\
echo "2. Make Build ..."                && \
make prefix=/usr lib=lib    \
    > $PKGLOG_BUILD 2>> $PKGLOG_ERROR   && \
\
echo "3. Make Check ..."                && \
make test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR     && \
\
echo "4. Make Install ..."              && \
make prefix=/usr lib=lib install    \
    > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR    \
\
; }

cd ..
rm -rf $PKG
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
