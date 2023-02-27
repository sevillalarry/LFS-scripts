# b.6.17.Binutils-2.39.sh
# Install

export PKG="binutils-2.39"
export PKGLOG_DIR=$LFSLOG/8.18
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

#rm -r $PKGLOG_DIR 2> /dev/null
#mkdir $PKGLOG_DIR

cd $PKG


cd   build

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make tooldir=/usr install
    > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

rm -fv /usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes}.a


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
