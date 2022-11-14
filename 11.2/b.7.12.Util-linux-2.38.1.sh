# b.7.12.Util-linux-2.38.1.sh
#

export PKG="util-linux-2.38.1"
export PKGLOG_DIR=$LFSLOG/7.12
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log

mkdir $PKGLOG_DIR

echo "1. Extract tar..."
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2> $PKGLOG_ERROR
cd $PKG

time { \
\
mkdir -pv /var/lib/hwclock  && \
\
echo "2. Configure ..."     && \
./configure ADJTIME_PATH=/var/lib/hwclock/adjtime    \
            --libdir=/usr/lib       \
            --docdir=/usr/share/doc/util-linux-2.38.1 \
            --disable-chfn-chsh     \
            --disable-login         \
            --disable-nologin       \
            --disable-su            \
            --disable-setpriv       \
            --disable-runuser       \
            --disable-pylibmount    \
            --disable-static        \
            --without-python        \
            runstatedir=/run        \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR  && \
\
echo "3. Make Build ..."                && \
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR  && \
\
echo "4. Make Install ..."              && \
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR    \
\
; }

cd ..
rm -rf $PKG
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
