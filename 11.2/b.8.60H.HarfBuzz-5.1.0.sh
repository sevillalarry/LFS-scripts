# b.8.60H.HarfBuzz-5.1.0.sh
#

export PKG="harfbuzz-5.1.0"
export PKGLOG_DIR=$LFSLOG/8.60H
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2> $PKGLOG_ERROR
cd $PKG

time { \
\
mkdir build    && \
cd    build    && \
\
echo "2. Configure ..."                 && \
meson --prefix=/usr           \
      --buildtype=release     \
      -Dgraphite2=enabled     \
     > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR && \
\
echo "3. Make Build ..."                && \
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR && \
\
echo "4. Make Check ..."                && \
ninja test                              \
     > $PKGLOG_CHECK 2>> $PKGLOG_ERROR  && \
\
echo "5. Make Install ..."              && \
ninja install                           \
     > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR     \
\
; }

cd ..
cd ..
rm -rf $PKG
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
