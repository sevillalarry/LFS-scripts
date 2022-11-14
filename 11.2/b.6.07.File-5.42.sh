# b.6.07.File-5.42.sh
#

export PKG="file-5.42"
export PKGLOG_DIR=$LFSLOG/6.07
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log

mkdir $PKGLOG_DIR

echo "1. Extract tar..."
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2> $PKGLOG_ERROR
cd $PKG

time { \
echo "2. Build for host..."
\
mkdir build                         && \
pushd build                         && \
  echo "2.1 Configure ..."          && \
  ../configure --disable-bzlib      \
               --disable-libseccomp \
               --disable-xzlib      \
               --disable-zlib       \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR    && \
  \
  echo "2.2 Make Build ..."               && \
  make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR  && \
popd                                && \
\
echo "3. Configure (again)..."  && \
./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess) \
  >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR     && \
\
echo "4. Make Build ..."                  && \
make FILE_COMPILE=$(pwd)/build/src/file   \
  >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR      && \
\
echo "5. Make Install ..."                && \
make DESTDIR=$LFS install                 \
    > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR   && \
\
rm -v $LFS/usr/lib/libmagic.la          \
\
; }

cd ..
rm -rf $PKG
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
