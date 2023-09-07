# a.06.07.File-5.45.sh
#

export PKG="file-5.45"
export PKGLOG_DIR=$LFSLOG/06.07
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
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


echo "2. Build for host..."
echo "2. Build for host..." >> $LFSLOG_PROCESS
echo "2. Build for host..." >> $PKGLOG_ERROR

mkdir build
pushd build
  echo "2.1 Configure ..."
  echo "2.1 Configure ..." >> $LFSLOG_PROCESS
  echo "2.1 Configure ..." >> $PKGLOG_ERROR
  ../configure --disable-bzlib      \
               --disable-libseccomp \
               --disable-xzlib      \
               --disable-zlib       \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
  
  echo "2.2 Make Build ..."
  echo "2.2 Make Build ..." >> $LFSLOG_PROCESS
  echo "2.2 Make Build ..." >> $PKGLOG_ERROR
  make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR
popd

echo "3. Configure (again)..."
echo "3. Configure (again)..." >> $LFSLOG_PROCESS
echo "3. Configure (again)..." >> $PKGLOG_ERROR
./configure --prefix=/usr             \
            --host=$LFS_TGT           \
            --build=$(./config.guess) \
  >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "4. Make Build ..."
echo "4. Make Build ..." >> $LFSLOG_PROCESS
echo "4. Make Build ..." >> $PKGLOG_ERROR
make FILE_COMPILE=$(pwd)/build/src/file   \
  >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make DESTDIR=$LFS install   \
    > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

rm $LFS/usr/lib/libmagic.la


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
