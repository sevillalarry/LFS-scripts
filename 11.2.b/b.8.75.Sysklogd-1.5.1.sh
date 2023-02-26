# b.8.75.Sysklogd-1.5.1.sh
#

export PKG="sysklogd-1.5.1"
export PKGLOG_DIR=$LFSLOG/8.75
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
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
sed -i '/Error loading kernel symbols/{n;n;d}' ksym_mod.c && \
sed -i 's/union wait/int/' syslogd.c                      && \
\
echo "2. Make Build ..."                  && \
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR    && \
\
echo "3. Make Install ..."                && \
make BINDIR=/sbin install                 \
     > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR  \
\
; }

cd ..
rm -rf $PKG
#unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD
# PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
