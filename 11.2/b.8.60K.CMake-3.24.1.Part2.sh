# b.8.60K.CMake-3.24.1.sh
#

export PKG="cmake-3.24.1"
export PKGLOG_DIR=$LFSLOG/8.60K
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log

#rm -r $PKGLOG_DIR 2> /dev/null
#mkdir $PKGLOG_DIR

cd $PKG

time { \
\
echo "3. Make Build ..."                && \
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR  && \
\
echo "4. Make Install ..."              && \
make install                            \
     > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR    \
\
; }


cd ..
rm -rf $PKG
#unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
