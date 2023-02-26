# b.8.73.Util-linux-2.38.1.Part2.sh
# Check

export PKG="util-linux-2.38.1"
export PKGLOG_DIR=$LFSLOG/8.73
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log

#rm -r $PKGLOG_DIR 2> /dev/null
#mkdir $PKGLOG_DIR

cd $PKG

time { \
\
echo "4. Make Check ..."                     && \
chown -Rv tester .                           && \
su tester -c "make -k check"                 \
     > $PKGLOG_CHECK 2>> $PKGLOG_ERROR       \
\
; }

cd ..
#rm -rf $PKG
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
