# b.8.28.Ncurses-6.3.sh
#

export PKG="ncurses-6.3"
export PKGLOG_DIR=$LFSLOG/8.28
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2> $PKGLOG_ERROR
cd $PKG

time { \
\
echo "2. Configure ..."     && \
./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --with-shared           \
            --without-debug         \
            --without-normal        \
            --with-cxx-shared       \
            --enable-pc-files       \
            --enable-widec          \
            --with-pkg-config-libdir=/usr/lib/pkgconfig \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR          && \
\
echo "3. Make Build ..."                && \
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR  && \
\
echo "4. Make Install ..."              && \
make DESTDIR=$PWD/dest install  \
    > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR && \
install -vm755 dest/usr/lib/libncursesw.so.6.3 /usr/lib && \
rm -v  dest/usr/lib/libncursesw.so.6.3                  && \
cp -av dest/* /                                         && \
\
for lib in ncurses form panel menu ; do
    rm -vf                    /usr/lib/lib${lib}.so
    echo "INPUT(-l${lib}w)" > /usr/lib/lib${lib}.so
    ln -sfv ${lib}w.pc        /usr/lib/pkgconfig/${lib}.pc
done    && \
\
rm -vf                     /usr/lib/libcursesw.so   && \
echo "INPUT(-lncursesw)" > /usr/lib/libcursesw.so   && \
ln -sfv libncurses.so      /usr/lib/libcurses.so    && \
\
mkdir -pv      /usr/share/doc/ncurses-6.3   && \
cp -v -R doc/* /usr/share/doc/ncurses-6.3   \
\
; }

cd ..
rm -rf $PKG
#unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
