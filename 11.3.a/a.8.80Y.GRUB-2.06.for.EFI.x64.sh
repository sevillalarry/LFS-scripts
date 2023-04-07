# a.8.80Y.GRUB-2.06 for EFI.x64.sh
#

export PKG="grub-2.06"
export PKGLOG_DIR=$LFSLOG/8.60Y
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


mkdir -p /usr/share/fonts/unifont
gunzip -c ../unifont-15.0.01.pcf.gz       \
  > /usr/share/fonts/unifont/unifont.pcf  \
  2>> $PKGLOG_ERROR

patch -Np1 -i ../grub-2.06-upstream_fixes-1.patch

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr         \
            --sysconfdir=/etc     \
            --disable-efiemu      \
            --enable-grub-mkfont  \
            --with-platform=efi   \
            --target=x86_64       \
            --disable-werror      \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

unset TARGET_CC

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

mv /etc/bash_completion.d/grub /usr/share/bash-completion/completions


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
#unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
