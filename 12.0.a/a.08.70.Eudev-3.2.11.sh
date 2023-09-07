# a.08.70.Eudev-3.2.11.sh
#

export PKG="eudev-3.2.11"
export PKGLOG_DIR=$LFSLOG/08.70
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


sed -i '/udevdir/a udev_dir=${udevdir}' src/udev/udev.pc.in

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr          \
            --bindir=/usr/sbin     \
            --sysconfdir=/etc      \
            --enable-manpages      \
            --disable-static       \
     > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Check ..."
echo "4. Make Check ..." >> $LFSLOG_PROCESS
echo "4. Make Check ..." >> $PKGLOG_ERROR
mkdir -p /usr/lib/udev/rules.d
mkdir -p /etc/udev/rules.d
make check > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "6. Extract custom rules & support files ..."
echo "6. Extract custom rules & support files ..." >> $LFSLOG_PROCESS
echo "6. Extract custom rules & support files ..." >> $PKGLOG_ERROR
tar -xvf ../udev-lfs-20171102.tar.xz    \
     >> $PKGLOG_TAR 2>> $PKGLOG_ERROR

echo "7. Make Install customs rules & support files ..."
echo "7. Make Install customs rules & support files ..." >> $LFSLOG_PROCESS
echo "7. Make Install customs rules & support files ..." >> $PKGLOG_ERROR
make -f udev-lfs-20171102/Makefile.lfs install    \
     >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
