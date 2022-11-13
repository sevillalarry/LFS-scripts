# b.8.16.Expect-5.45.4.sh
#

export PKG="expect5.45.4"
export PKGLOG_DIR=$LFSLOG/8.16
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log

mkdir $PKGLOG_DIR

echo "1. Extract tar..."
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2> $PKGLOG_ERROR
cd $PKG

time { \
\
echo "2. Configure ..."         && \
./configure --prefix=/usr           \
            --with-tcl=/usr/lib     \
            --enable-shared         \
            --mandir=/usr/share/man \
            --with-tclinclude=/usr/include  \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR      && \
\
echo "3. Make Build ..."                && \
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR  && \
\
echo "4. Make Check ..."                && \
make test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR         && \
\
echo "5. Make Install ..."              && \
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR    && \
\
ln -svf expect5.45.4/libexpect5.45.4.so /usr/lib    \
\
; }

cd ..
rm -rf $PKG
unset PKGLOG_ERROR PKGLOG_INSTALL PKGLOG_CHECK
unset PKGLOG_BUILD PKGLOG_CONFIG PKGLOG_TAR
unset PKGLOG_DIR PKG
