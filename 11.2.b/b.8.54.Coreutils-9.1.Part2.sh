# b.8.54.Coreutils-9.1.Part2.sh
# test / check

export PKG="coreutils-9.1"
export PKGLOG_DIR=$LFSLOG/8.54
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
echo "4. Test ..."                          && \
\
make NON_ROOT_USERNAME=tester check-root    \
    $PKGLOG_CHECK 2>> $PKGLOG_ERROR         && \
\
chown -Rv tester .                          \
    $PKGLOG_OTHERS 2>> $PKGLOG_ERROR        && \
\
su tester -c "PATH=$PATH make RUN_EXPENSIVE_TESTS=yes check"    \
    $PKGLOG_CHECK 2>> $PKGLOG_ERROR         && \
\
sed -i '/dummy/d' /etc/group                \
\
; }

cd ..
#rm -rf $PKG
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
