# a.8.26.GCC-12.2.0.Part2.sh
# Check 1

export PKG="gcc-12.2.0"
export PKGLOG_DIR=$LFSLOG/8.26
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_CHOWN=$PKGLOG_DIR/chown.log
export LFSLOG_PROCESS=$LFSLOG/process.log

#rm -r $PKGLOG_DIR 2> /dev/null
#mkdir $PKGLOG_DIR

cd $PKG


cd   build

echo "4. Make Check 1 ..."
echo "4. Make Check 1 ..." >> $LFSLOG_PROCESS
echo "4. Make Check 1 ..." >> $PKGLOG_ERROR
ulimit -s 32768

chown -Rv tester . > $PKGLOG_CHOWN 2>> $PKGLOG_ERROR
su tester -c "PATH=$PATH make -k check"
  > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

../contrib/test_summary
  >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR


cd ..
cd ..
#rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKGLOG_CHOWN PKG
