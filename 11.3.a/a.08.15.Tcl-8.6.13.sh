# a.08.15.Tcl-8.6.13.sh
#

export PKG="tcl8.6.13"
export PKGLOG_DIR=$LFSLOG/08.15
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG-src.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


SRCDIR=$(pwd)
cd unix

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr               \
            --mandir=/usr/share/man     \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Remove References to Build Directory ..."
echo "4. Remove References to Build Directory ..." >> $LFSLOG_PROCESS
echo "4. Remove References to Build Directory ..." >> $PKGLOG_ERROR

sed -e "s|$SRCDIR/unix|/usr/lib|" \
    -e "s|$SRCDIR|/usr/include|"  \
    -i tclConfig.sh

sed -e "s|$SRCDIR/unix/pkgs/tdbc1.1.5|/usr/lib/tdbc1.1.5|" \
    -e "s|$SRCDIR/pkgs/tdbc1.1.5/generic|/usr/include|"    \
    -e "s|$SRCDIR/pkgs/tdbc1.1.5/library|/usr/lib/tcl8.6|" \
    -e "s|$SRCDIR/pkgs/tdbc1.1.5|/usr/include|"            \
    -i pkgs/tdbc1.1.5/tdbcConfig.sh

sed -e "s|$SRCDIR/unix/pkgs/itcl4.2.3|/usr/lib/itcl4.2.3|" \
    -e "s|$SRCDIR/pkgs/itcl4.2.3/generic|/usr/include|"    \
    -e "s|$SRCDIR/pkgs/itcl4.2.3|/usr/include|"            \
    -i pkgs/itcl4.2.3/itclConfig.sh

unset SRCDIR

echo "5. Make Check ..."
echo "5. Make Check ..." >> $LFSLOG_PROCESS
echo "5. Make Check ..." >> $PKGLOG_ERROR
make test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "6. Make Install ..."
echo "6. Make Install ..." >> $LFSLOG_PROCESS
echo "6. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

chmod u+w /usr/lib/libtcl8.6.so

echo "7. Make Install Private Headers..."
echo "7. Make Install Private Headers..." >> $LFSLOG_PROCESS
echo "7. Make Install Private Headers..." >> $PKGLOG_ERROR
make install-private-headers    \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

ln -sf tclsh8.6 /usr/bin/tclsh

mv /usr/share/man/man3/{Thread,Tcl_Thread}.3

echo "8. Extract html tar..."
echo "8. Extract html tar..." >> $LFSLOG_PROCESS
echo "8. Extract html tar..." >> $PKGLOG_ERROR
cd ..
tar -xf ../tcl8.6.13-html.tar.gz --strip-components=1
mkdir -p /usr/share/doc/tcl-8.6.13
cp -r ./html/* /usr/share/doc/tcl-8.6.13


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
