# a.05.04.Linux-6.1.31.API.Headers.sh
#

# (based on Errata use: )
export PKG="linux-6.1.31"
export PKGLOG_DIR=$LFSLOG/05.04
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
#export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. Make MrProper ..."
echo "2. Make MrProper ..." >> $LFSLOG_PROCESS
echo "2. Make MrProper ..." >> $PKGLOG_ERROR
make mrproper > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "3. Make Headers ..."
echo "3. Make Headers ..." >> $LFSLOG_PROCESS
echo "3. Make Headers ..." >> $PKGLOG_ERROR
make headers >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
find usr/include -type f ! -name '*.h' -delete  \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -rv usr/include $LFS/usr                     \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
# PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
