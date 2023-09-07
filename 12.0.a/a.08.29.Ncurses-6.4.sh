# a.08.29.Ncurses-6.4.sh
#

export PKG="ncurses-6.4"
export PKGLOG_DIR=$LFSLOG/08.29
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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


echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --with-shared           \
            --without-debug         \
            --without-normal        \
            --with-cxx-shared       \
            --enable-pc-files       \
            --enable-widec          \
            --with-pkg-config-libdir=/usr/lib/pkgconfig \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make DESTDIR=$PWD/dest install  \
    > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -m755 dest/usr/lib/libncursesw.so.6.4 /usr/lib
rm dest/usr/lib/libncursesw.so.6.4
cp -a dest/* /

for lib in ncurses form panel menu ; do
    rm -f                       /usr/lib/lib${lib}.so
    echo "INPUT(-l${lib}w)" >   /usr/lib/lib${lib}.so
    ln -sf ${lib}w.pc           /usr/lib/pkgconfig/${lib}.pc
done

rm -f                       /usr/lib/libcursesw.so
echo "INPUT(-lncursesw)" >  /usr/lib/libcursesw.so
ln -sf libncurses.so        /usr/lib/libcurses.so

cp -R doc -T /usr/share/doc/ncurses-6.4


cd ..
rm -rf $PKG
#unset PKGLOG_CHECK
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
