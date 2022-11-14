# b.6.17.Binutils-2.39.sh
#

export PKG="binutils-2.39"
export PKGLOG_DIR=$LFSLOG/8.18
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log

mkdir $PKGLOG_DIR

echo "1. Extract tar..."
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2> $PKGLOG_ERROR
cd $PKG

# Verify that the PTYs are working properly
# inside chroot environment
#
# pls see check.log
expect -c "spawn ls" > $PKGLOG_CHECK 2> $PKGLOG_ERROR

time { \
\
mkdir -v build  && \
cd       build  && \
\
echo "2. Configure ..."         && \
../configure --prefix=/usr          \
             --sysconfdir=/etc      \
             --enable-gold          \
             --enable-ld=default    \
             --enable-plugins       \
             --enable-shared        \
             --disable-werror       \
             --enable-64-bit-bfd    \
             --with-system-zlib     \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR  && \
\
echo "3. Make Build ..."                && \
make tooldir=/usr   \
    > $PKGLOG_BUILD 2>> $PKGLOG_ERROR   && \
\
echo "4. Make Check ..."                && \
make -k check   \
    >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR  && \
\
echo "5. Make Install ..."              && \
make tooldir=/usr install   \
    > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR && \
\
rm -fv /usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes}.a    \
\
; }

cd ..
cd ..
rm -rf $PKG
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
