# b.8.60H.p11-kit-0.24.1.sh
#

export PKG="p11-kit-0.24.1"
export PKGLOG_DIR=$LFSLOG/8.60H
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2> $PKGLOG_ERROR
cd $PKG

sed '20,$ d' -i trust/trust-extract-compat   &&
cat >> trust/trust-extract-compat << "EOF"
# Copy existing anchor modifications to /etc/ssl/local
/usr/libexec/make-ca/copy-trust-modifications

# Update trust stores
/usr/sbin/make-ca -r
EOF

time { \
\
mkdir p11-build &&
cd    p11-build &&
\
echo "2. Meson / Configure ..."              && \
meson --prefix=/usr                          \
      --buildtype=release                    \
      -Dtrust_paths=/etc/pki/anchors         && \
     > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR      && \
\
echo "3. Ninja / Make Build ..."             && \
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR      && \
\
echo "4. Ninja / Make Install ..."           && \
ninja install                                \
     > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR     && \
\
ln -sfv /usr/libexec/p11-kit/trust-extract-compat \
        /usr/bin/update-ca-certificates      \
\
; }


cd ..
cd ..
rm -rf $PKG
#unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
