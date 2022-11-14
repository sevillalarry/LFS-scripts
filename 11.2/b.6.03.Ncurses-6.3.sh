# b.6.03.Ncurses-6.3.sh
#

export PKG="ncurses-6.3"
export PKGLOG_DIR=$LFSLOG/6.03
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
\
sed -i s/mawk// configure && \
\
echo "2. Build tic ..."   && \
mkdir build           && \
pushd build           && \
  ../configure      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR  && \
  make -C include   >  $PKGLOG_BUILD 2>> $PKGLOG_ERROR  && \
  make -C progs tic >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR  && \
popd                  && \
\
echo "3. Configure ncurses ..."       && \
./configure --prefix=/usr                 \
            --host=$LFS_TGT               \
            --build=$(./config.guess)     \
            --mandir=/usr/share/man       \
            --with-manpage-format=normal  \
            --with-shared                 \
            --without-normal              \
            --with-cxx-shared             \
            --without-debug               \
            --without-ada                 \
            --disable-stripping           \
            --enable-widec                \
            >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR && \
\
echo "4. Make Build ..."                        && \
make >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR         && \
\
echo "5. Make Install ..."                      && \
make DESTDIR=$LFS TIC_PATH=$(pwd)/build/progs/tic install \
    > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR         && \
echo "INPUT(-lncursesw)" > $LFS/usr/lib/libncurses.so     \
\
; }

cd ..
rm -rf $PKG
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
