# b.8.62.IPRoute2-5.19.0.sh
#

export PKG="iproute2-5.19.0"
export PKGLOG_DIR=$LFSLOG/8.62
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2> $PKGLOG_ERROR
cd $PKG

time { \
\
sed -i /ARPD/d Makefile && \
rm -fv man/man8/arpd.8  && \
\
echo "2. Make Build ..."                  && \
make NETNS_RUN_DIR=/run/netns \
  > $PKGLOG_BUILD 2>> $PKGLOG_ERROR       && \
\
echo "3. Make Install ..."                && \
make SBINDIR=/usr/sbin install  \
     > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR  && \
\
mkdir -pv             /usr/share/doc/iproute2-5.19.0  && \
cp -v COPYING README* /usr/share/doc/iproute2-5.19.0  \
\
; }

cd ..
rm -rf $PKG
#unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD
# PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
