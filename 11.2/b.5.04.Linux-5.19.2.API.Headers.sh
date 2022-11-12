# b.5.04.Linux-5.19.2.API.Headers.sh
#

export LOG="5.04.Linux-5.19.2.API.Headers"
export PKG="linux-5.15.76"
export PKGLOG_TAR=$LFSLOG_TAR/$LOG
#export PKGLOG_CONFIG=$LFSLOG_CONFIG/$LOG
#export PKGLOG_BUILD=$LFSLOG_BUILD/$LOG
#export PKGLOG_INSTALL=$LFSLOG_INSTALL/$LOG
export PKGLOG_ERROR=$LFSLOG_ERROR/$LOG
export PKGLOG_OTHERS=$LFSLOG_OTHERS/$LOG

echo "1. Extract tar..."
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2> $PKGLOG_ERROR
cd $PKG

time { \
\
echo "2. Make MrProper ..."                         && \
make mrproper > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR    && \
\
echo "3. Make Headers ..."                          && \
make headers >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR    && \
find usr/include -type f ! -name '*.h' -delete      \
             >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR    && \
cp -rv usr/include $LFS/usr                         \
             >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR    \
\
; }

cd ..
rm -rf $PKG
unset PKGLOG_OTHERS PKGLOG_ERROR
# PKGLOG_INSTALL
# PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_TAR
unset PKG LOG
