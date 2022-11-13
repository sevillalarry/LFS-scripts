# b.8.14.Flex-2.6.4.sh
#

export PKG="flex-2.6.4"
export PKGLOG_DIR=$LFSLOG/8.14
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
echo "2. Configure ..."                 && \
./configure --prefix=/usr                       \
            --docdir=/usr/share/doc/flex-2.6.4  \
            --disable-static                    \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR  && \
\
echo "3. Make Build ..."                && \
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR  && \
\
echo "4. Make Check ..."                && \
make check > $PKGLOG_CHECK 2>> $PKGLOG_ERROR        && \
\
echo "5. Make Install ..."              && \
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR    && \
\
ln -sv flex /usr/bin/lex    \
\
; }

cd ..
rm -rf $PKG
unset PKG
