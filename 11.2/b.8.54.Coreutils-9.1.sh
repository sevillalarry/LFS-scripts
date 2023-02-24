# b.8.54.Coreutils-9.1.sh
#

export PKG="coreutils-9.1"
export PKGLOG_DIR=$LFSLOG/8.54
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2> $PKGLOG_ERROR
cd $PKG

time { \
\
patch -Np1 -i ../coreutils-9.1-i18n-1.patch         && \
\
echo "2. Configure ..."                 && \
autoreconf -fiv                         && \
FORCE_UNSAFE_CONFIGURE=1 ./configure    \
            --prefix=/usr               \
            --enable-no-install-program=kill,uptime \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR      && \
\
echo "3. Make Build ..."                    && \
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR      && \
\
echo "4. Test ..."                          && \
\
make NON_ROOT_USERNAME=tester check-root    \
    $PKGLOG_CHECK 2>> $PKGLOG_ERROR         && \
\
chown -Rv tester .                          \
    $PKGLOG_OTHERS 2>> $PKGLOG_ERROR        && \
\
su tester -c "PATH=$PATH make RUN_EXPENSIVE_TESTS=yes check"    \
    $PKGLOG_CHECK 2>> $PKGLOG_ERROR         && \
\
sed -i '/dummy/d' /etc/group                && \
\
echo "5. Make Install ..."                  && \
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR    && \
\
mv -v /usr/bin/chroot /usr/sbin                     && \
mv -v /usr/share/man/man1/chroot.1                  \
    /usr/share/man/man8/chroot.8                    && \
sed -i 's/"1"/"8"/' /usr/share/man/man8/chroot.8    \
\
; }

cd ..
rm -rf $PKG
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
