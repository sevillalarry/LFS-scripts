# a.08.73.Jinja2-3.1.2.sh
#

export PKG="Jinja2-3.1.2"
export PKGLOG_DIR=$LFSLOG/08.73
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
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


echo "2. pip3 wheel Build ..."
echo "2. pip3 wheel Build ..." >> $LFSLOG_PROCESS
echo "2. pip3 wheel Build ..." >> $PKGLOG_ERROR
pip3 wheel      -w dist                 \
                --no-build-isolation    \
                --no-deps               \
                $PWD                    \
                > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "3. pip3 Install ..."
echo "3. pip3 Install ..." >> $LFSLOG_PROCESS
echo "3. pip3 Install ..." >> $PKGLOG_ERROR
pip3 install    --no-index              \
                --no-user               \
                --find-links dist       \
                Jinja2                  \
                > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD
#PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
