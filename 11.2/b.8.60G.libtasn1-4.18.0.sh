# b.8.60G.libtasn1-4.18.0.sh
#

export PKG="libtasn1-4.18.0"
export PKGLOG_DIR=$LFSLOG/8.60G
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
echo "2. Configure ..."                   && \
./configure --prefix=/usr                 \
           --disable-static               \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR  && \
\
echo "3. Make Build ..."                && \
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR  && \
\
echo "4. Make Install ..."              && \
make install                                 \
     > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR     \
\
; }


cd ..
rm -rf $PKG
#unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
