# b.8.07.Bzip2-1.0.8.sh
#

export PKG="bzip2-1.0.8"
export PKGLOG_DIR=$LFSLOG/8.07
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log

mkdir $PKGLOG_DIR

echo "1. Extract tar..."
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2> $PKGLOG_ERROR
cd $PKG

time { \
\
patch -Np1 -i ../bzip2-1.0.8-install_docs-1.patch       && \
\
sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile     && \
\
sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile   && \
\
echo "2. Make Build libbz2 ..."         && \
make -f Makefile-libbz2_so              \
    > $PKGLOG_BUILD 2>> $PKGLOG_ERROR   && \
\
echo "3. Make Clean-up ..."             && \
make clean                              \
    > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR  && \
\
echo "4. Make Build ..."                && \
make >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR && \
\
echo "5. Make Install ..."              && \
make PREFIX=/usr install                \
    > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR && \
\
cp -av libbz2.so.* /usr/lib                 && \
ln -sv libbz2.so.1.0.8 /usr/lib/libbz2.so   && \
\
cp -v bzip2-shared /usr/bin/bzip2           && \
for i in /usr/bin/{bzcat,bunzip2}; do
  ln -sfv bzip2 $i
done                                        && \
\
rm -fv /usr/lib/libbz2.a                    \
\
; }

cd ..
rm -rf $PKG
unset PKGLOG_ERROR PKGLOG_INSTALL PKGLOG_OTHERS
unset PKGLOG_BUILD PKGLOG_TAR
# PKGLOG_CONFIG
unset PKGLOG_DIR PKG
