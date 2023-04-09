# a.08.63.Kbd-2.5.1.sh
#

export PKG="kbd-2.5.1"
export PKGLOG_DIR=$LFSLOG/08.63
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
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


echo "2. Patching..."
echo "2. Patching..." >> $LFSLOG_PROCESS
echo "2. Patching..." >> $PKGLOG_ERROR
patch -Np1 -i ../kbd-2.5.1-backspace-1.patch \
     > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

sed -i '/RESIZECONS_PROGS=/s/yes/no/' configure
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in

echo "3. Configure ..."
echo "3. Configure ..." >> $LFSLOG_PROCESS
echo "3. Configure ..." >> $PKGLOG_ERROR
./configure    --prefix=/usr       \
               --disable-vlock     \
     > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "4. Make Build ..."
echo "4. Make Build ..." >> $LFSLOG_PROCESS
echo "4. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "5. Make Check ..."
echo "5. Make Check ..." >> $LFSLOG_PROCESS
echo "5. Make Check ..." >> $PKGLOG_ERROR
make check > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "6. Make Install ..."
echo "6. Make Install ..." >> $LFSLOG_PROCESS
echo "6. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

mkdir -p            /usr/share/doc/kbd-2.5.1
cp -R docs/doc/*    /usr/share/doc/kbd-2.5.1


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
