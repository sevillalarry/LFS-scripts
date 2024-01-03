# a.08.92C.OpenSSH-9.6p1.sh
# errata
#

export PKG="openssh-9.6p1"
export PKGLOG_DIR=$LFSLOG/08.92C
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
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


echo "2. Initial Install ..."
echo "2. Initial Install ..." >> $LFSLOG_PROCESS
echo "2. Initial Install ..." >> $PKGLOG_ERROR

install -g sys -m700 -d /var/lib/sshd

groupadd -g 50 sshd
useradd  -c 'sshd PrivSep'  \
         -d /var/lib/sshd   \
         -g sshd            \
         -s /bin/false      \
         -u 50 sshd         \
        > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "3. Configure ..."
echo "3. Configure ..." >> $LFSLOG_PROCESS
echo "3. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr                               \
            --sysconfdir=/etc/ssh                       \
            --with-privsep-path=/var/lib/sshd           \
            --with-default-path=/usr/bin                \
            --with-superuser-path=/usr/sbin:/usr/bin    \
            --with-pid-dir=/run                         \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "4. Make Build ..."
echo "4. Make Build ..." >> $LFSLOG_PROCESS
echo "4. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "5. Make Test ..."
echo "5. Make Test ..." >> $LFSLOG_PROCESS
echo "5. Make Test ..." >> $PKGLOG_ERROR
make -j1 tests  \
    > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "6. Make Install ..."
echo "6. Make Install ..." >> $LFSLOG_PROCESS
echo "6. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -m755       contrib/ssh-copy-id /usr/bin

install -m644       contrib/ssh-copy-id.1               \
                    /usr/share/man/man1
install -m755 -d    /usr/share/doc/openssh-9.6p1
install -m644       INSTALL LICENCE OVERVIEW README*    \
                    /usr/share/doc/openssh-9.6p1

echo "."
echo "."                                                    >> $LFSLOG_PROCESS
echo "OpenSSH installed but NOT configured for start-up"
echo "OpenSSH installed but NOT configured for start-up"    >> $LFSLOG_PROCESS
echo "."
echo "."                                                    >> $LFSLOG_PROCESS
echo "Configure OpenSSH after installing BLFS-bootscripts"
echo "Configure OpenSSH after installing BLFS-bootscripts"  >> $LFSLOG_PROCESS
echo "."
echo "."                                                    >> $LFSLOG_PROCESS


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
