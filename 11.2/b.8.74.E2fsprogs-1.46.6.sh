# b.8.74.E2fsprogs-1.46.6.sh
#

export PKG="e2fsprogs-1.46.6"
export PKGLOG_DIR=$LFSLOG/8.74
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
cd source

mkdir -v build
cd       build

time { \
\
echo "2. Configure ..."                           && \
../configure --prefix=/usr         \
             --sysconfdir=/etc     \
             --enable-elf-shlibs   \
             --disable-libblkid    \
             --disable-libuuid     \
             --disable-uuidd       \
             --disable-fsck        \
             > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR   && \
\
echo "3. Make Build ..."                     && \
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR       && \
\
echo "4. Make Check ..."                     && \
make check                                   \
     > $PKGLOG_CHECK 2>> $PKGLOG_ERROR       && \
\
echo "5. Make Install ..."                   && \
make install                                 \
     > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR     && \
\
rm -fv /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a  && \
\
gunzip -v /usr/share/info/libext2fs.info.gz  && \
install-info --dir-file=/usr/share/info/dir  \
     /usr/share/info/libext2fs.info          && \
\
makeinfo -o      doc/com_err.info            \
     ../lib/et/com_err.texinfo               && \
install -v -m644 doc/com_err.info            \
     /usr/share/info                         && \
install-info --dir-file=/usr/share/info/dir  \
     /usr/share/info/com_err.info            \
\
; }

cd ..
cd ..
rm -rf $PKG
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
