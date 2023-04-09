# a.08.07.Bzip2-1.0.8.sh
#

export PKG="bzip2-1.0.8"
export PKGLOG_DIR=$LFSLOG/08.07
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. Patching for documentation..."
echo "2. Patching for documentation..." >> $LFSLOG_PROCESS
echo "2. Patching for documentation..." >> $PKGLOG_ERROR
patch -Np1 -i ../bzip2-1.0.8-install_docs-1.patch   \
     > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile

sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile

echo "3. Make Build libbz2 ..."
echo "3. Make Build libbz2 ..." >> $LFSLOG_PROCESS
echo "3. Make Build libbz2 ..." >> $PKGLOG_ERROR
make -f Makefile-libbz2_so  \
    > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Clean-up ..."
echo "4. Make Clean-up ..." >> $LFSLOG_PROCESS
echo "4. Make Clean-up ..." >> $PKGLOG_ERROR
make clean >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "5. Make Build ..."
echo "5. Make Build ..." >> $LFSLOG_PROCESS
echo "5. Make Build ..." >> $PKGLOG_ERROR
make >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "6. Make Install ..."
echo "6. Make Install ..." >> $LFSLOG_PROCESS
echo "6. Make Install ..." >> $PKGLOG_ERROR
make PREFIX=/usr install    \
    > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

cp -a libbz2.so.* /usr/lib
ln -s libbz2.so.1.0.8 /usr/lib/libbz2.so

cp  bzip2-shared /usr/bin/bzip2
for i in /usr/bin/{bzcat,bunzip2}; do
  ln -sf bzip2 $i
done

rm -f /usr/lib/libbz2.a


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD
# PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
