# b.8.15.Tcl-8.6.12.sh
#

export PKG="tcl8.6.12"
export PKGLOG_DIR=$LFSLOG/8.15
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log

mkdir $PKGLOG_DIR

echo "1. Extract tar..."
tar xvf $PKG-src.tar.gz > $PKGLOG_TAR 2> $PKGLOG_ERROR
cd $PKG

time { \
\
tar -xf ../tcl8.6.12-html.tar.gz --strip-components=1   \
    >> $PKGLOG_TAR 2> $PKGLOG_ERROR     && \
\
SRCDIR=$(pwd)   && \
cd unix         && \
echo "2. Configure ..."                 && \
./configure --prefix=/usr               \
            --mandir=/usr/share/man     \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR  && \
\
echo "3. Make Build ..."                && \
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR  && \
\
sed -e "s|$SRCDIR/unix|/usr/lib|" \
    -e "s|$SRCDIR|/usr/include|"  \
    -i tclConfig.sh             && \
\
sed -e "s|$SRCDIR/unix/pkgs/tdbc1.1.3|/usr/lib/tdbc1.1.3|" \
    -e "s|$SRCDIR/pkgs/tdbc1.1.3/generic|/usr/include|"    \
    -e "s|$SRCDIR/pkgs/tdbc1.1.3/library|/usr/lib/tcl8.6|" \
    -e "s|$SRCDIR/pkgs/tdbc1.1.3|/usr/include|"            \
    -i pkgs/tdbc1.1.3/tdbcConfig.sh                     && \
\
sed -e "s|$SRCDIR/unix/pkgs/itcl4.2.2|/usr/lib/itcl4.2.2|" \
    -e "s|$SRCDIR/pkgs/itcl4.2.2/generic|/usr/include|"    \
    -e "s|$SRCDIR/pkgs/itcl4.2.2|/usr/include|"            \
    -i pkgs/itcl4.2.2/itclConfig.sh                     && \
\
unset SRCDIR    && \
\
echo "4. Make Check ..."                && \
make test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR         && \
\
echo "5. Make Install ..."              && \
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR    && \
\
chmod -v u+w /usr/lib/libtcl8.6.so  && \
\
make install-private-headers        && \
\
ln -sfv tclsh8.6 /usr/bin/tclsh     && \
\
mv /usr/share/man/man3/{Thread,Tcl_Thread}.3    && \
\
mkdir -v -p /usr/share/doc/tcl-8.6.12           && \
cp -v -r  ../html/* /usr/share/doc/tcl-8.6.12   \
\
; }

cd ..
cd ..
rm -rf $PKG
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
