# a.09.99.BLFS-Bootscripts-20231119.extract.only.sh
# SVN due to errata in BLFS
#
# This will only extract the .tar.xz file
# and will NOT delete the source directory

export PKG="blfs-bootscripts-20231119"
export PKGLOG_DIR=$LFSLOG/09.99
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
#export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "Extract tar..."
echo "Extract tar..." >> $LFSLOG_PROCESS
echo "Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR

unset LFSLOG_PROCESS
#unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
