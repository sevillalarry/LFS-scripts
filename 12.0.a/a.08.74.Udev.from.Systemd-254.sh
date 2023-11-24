# a.08.74.Udev.from.Systemd-254.sh
#

export PKG="systemd-254"
export PKGLOG_DIR=$LFSLOG/08.74
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
#export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
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


sed -i -e 's/GROUP="render"/GROUP="video"/' \
       -e 's/GROUP="sgx", //' rules.d/50-udev-default.rules.in

sed '/systemd-sysctl/s/^/#/' -i rules.d/99-systemd.rules.in

mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup                     \
      --prefix=/usr             \
      --buildtype=release       \
      -Dmode=release            \
      -Ddev-kvm-mode=0660       \
      -Dlink-udev-shared=false  \
      ..                        \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja udevadm systemd-hwdb                                              \
      $(grep -o -E "^build (src/libudev|src/udev|rules.d|hwdb.d)[^:]*"  \
        build.ninja | awk '{ print $2 }')                               \
      $(realpath libudev.so --relative-to .)                            \
        > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "6. Ninja Install ..."
echo "6. Ninja Install ..." >> $LFSLOG_PROCESS
echo "6. Ninja Install ..." >> $PKGLOG_ERROR
rm rules.d/90-vconsole.rules

install -m755 -d {/usr/lib,/etc}/udev/{hwdb,rules}.d
install -m755 -d /usr/{lib,share}/pkgconfig
install -m755 udevadm                     /usr/bin/
install -m755 systemd-hwdb                /usr/bin/udev-hwdb
ln      -sfn  ../bin/udevadm              /usr/sbin/udevd
cp      -a    libudev.so{,*[0-9]}         /usr/lib/
install -m644 ../src/libudev/libudev.h    /usr/include/
install -m644 src/libudev/*.pc            /usr/lib/pkgconfig/
install -m644 src/udev/*.pc               /usr/share/pkgconfig/
install -m644 ../src/udev/udev.conf       /etc/udev/
install -m644 rules.d/* ../rules.d/{*.rules,README} /usr/lib/udev/rules.d/
install -m644 hwdb.d/*  ../hwdb.d/{*.hwdb,README}   /usr/lib/udev/hwdb.d/
install -m755 $(find src/udev -type f | grep -F -v ".") /usr/lib/udev

tar -xvf ../../udev-lfs-20230818.tar.xz \
        >> $PKGLOG_TAR 2>> $PKGLOG_ERROR
make -f udev-lfs-20230818/Makefile.lfs install

tar -xf ../../systemd-man-pages-254.tar.xz                            \
    --no-same-owner --strip-components=1                              \
    -C /usr/share/man --wildcards '*/udev*' '*/libudev*'              \
                                  '*/systemd-'{hwdb,udevd.service}.8
sed 's/systemd\(\\\?-\)/udev\1/' /usr/share/man/man8/systemd-hwdb.8   \
                               > /usr/share/man/man8/udev-hwdb.8
sed 's|lib.*udevd|sbin/udevd|'                                        \
    /usr/share/man/man8/systemd-udevd.service.8                       \
  > /usr/share/man/man8/udevd.8
rm  /usr/share/man/man8/systemd-*.8

udev-hwdb update


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
#unset PKGLOG_OTHERS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
