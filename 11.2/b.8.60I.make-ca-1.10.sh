# b.8.60I.make-ca-1.10.sh
#

export PKG="make-ca-1.10"
export PKGLOG_DIR=$LFSLOG/8.60I
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
#export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_DOWNLOAD=$PKGLOG_DIR/download.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2> $PKGLOG_ERROR
cd $PKG

time { \
\
echo "2. Make Install ..."                   && \
make install                                 \
     > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR     && \
\
install -vdm755 /etc/ssl/local               && \
\
/usr/sbin/make-ca -g                         \
     > $PKGLOG_DOWNLOAD 2>> $PKGLOG_ERROR    \
\
; }


cd ..
rm -rf $PKG
#unset PKGLOG_CHECK
unset PKGLOG_DOWNLOAD
unset PKGLOG_INSTALL
# PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
