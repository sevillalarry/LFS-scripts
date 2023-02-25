# b.8.60L.efivar-38.sh
#

export PKG="efivar-38"
export PKGLOG_DIR=$LFSLOG/8.60L
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
sed '/prep :/a\\ttouch prep'              \
  -i src/Makefile                         && \
\
sed '/sys\/mount\.h/d'                    \
  -i src/util.h                           && \
sed '/unistd\.h/a#include <sys/mount.h>'  \
  -i src/gpt.c src/linux.c                && \
\
echo "2. Make Build ..."                  && \
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR    && \
\
echo "3. Make Install ..."                && \
make install LIBDIR=/usr/lib              \
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
