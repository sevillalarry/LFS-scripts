# b.8.58.Findutils-4.9.0.sh
#

export PKG="findutils-4.9.0"
export PKGLOG_DIR=$LFSLOG/8.58
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
echo "2. Configure ..."                 && \
case $(uname -m) in
    i?86)   TIME_T_32_BIT_OK=yes ./configure --prefix=/usr --localstatedir=/var/lib/locate ;;
    x86_64) ./configure --prefix=/usr --localstatedir=/var/lib/locate ;;
esac                                    \
     > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR && \
\
echo "3. Make Build ..."                && \
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR  && \
\
echo "4. Make Check ..."                && \
chown -Rv tester .                      \
    $PKGLOG_OTHERS 2>> $PKGLOG_ERROR    && \
su tester -c "PATH=$PATH make check"    \
    $PKGLOG_CHECK 2>> $PKGLOG_ERROR     && \
\
echo "5. Make Install ..."              && \
make install                                 \
     > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR     \
\
; }

cd ..
rm -rf $PKG
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
