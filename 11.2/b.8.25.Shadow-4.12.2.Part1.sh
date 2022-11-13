# b.8.25.Shadow-4.12.2.Part1.sh
#

export PKG="shadow-4.12.2"
export PKGLOG_DIR=$LFSLOG/8.25
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

time { \
\
sed -i 's/groups$(EXEEXT) //' src/Makefile.in                   && \
find man -name Makefile.in -exec sed -i 's/groups\.1 / /'   {}  && \
find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {}  && \
find man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {}  && \
\
sed -e 's:#ENCRYPT_METHOD DES:ENCRYPT_METHOD SHA512:' \
    -e 's:/var/spool/mail:/var/mail:'                 \
    -e '/PATH=/{s@/sbin:@@;s@/bin:@@}'                \
    -i etc/login.defs                               && \
\
touch /usr/bin/passwd       && \
echo "2. Configure ..."     && \
./configure --sysconfdir=/etc \
            --disable-static  \
            --with-group-name-max-length=32     && \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR          && \
\
echo "3. Make Build ..."                && \
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR  && \
\
echo "4. Make Install ..."              && \
make exec_prefix=/usr install   \
     > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR    && \
make -C man install-man         \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR    && \
\
; }

cd ..
rm -rf $PKG
unset PKGLOG_ERROR PKGLOG_INSTALL PKGLOG_CHECK
unset PKGLOG_BUILD PKGLOG_CONFIG PKGLOG_TAR
unset PKGLOG_DIR PKG
