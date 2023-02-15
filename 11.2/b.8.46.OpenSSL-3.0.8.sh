# b.8.46.OpenSSL-3.0.8.sh
#

export PKG="openssl-3.0.8"
export PKGLOG_DIR=$LFSLOG/8.46
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log

mkdir $PKGLOG_DIR

echo "1. Extract tar..."
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2> $PKGLOG_ERROR
cd $PKG

time { \
\
echo "2. Configure ..."            && \
./config --prefix=/usr             \
         --openssldir=/etc/ssl     \
         --libdir=lib              \
         shared                    \
         zlib-dynamic              \
         > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR  && \
\
echo "3. Make Build ..."                && \
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR  && \
\
echo "4. Make Check ..."                && \
make test                               \
     > $PKGLOG_CHECK 2>> $PKGLOG_ERROR  && \
\
echo "5. Make Install ..."              && \
sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile    && \
make MANSUFFIX=ssl install                   \
     > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR     && \
\
mv -v /usr/share/doc/openssl /usr/share/doc/openssl-3.0.8   && \
\
cp -vfr doc/* /usr/share/doc/openssl-3.0.8   \
\
; }

cd ..
rm -rf $PKG
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
