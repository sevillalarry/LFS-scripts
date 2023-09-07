# a.08.27.GCC-13.2.0.sh
#

export PKG="gcc-13.2.0"
export PKGLOG_DIR=$LFSLOG/08.27
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_CHOWN=$PKGLOG_DIR/chown.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
  ;;
esac

mkdir build
cd    build

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
../configure --prefix=/usr            \
             LD=ld                    \
             --enable-languages=c,c++ \
             --enable-default-pie     \
             --enable-default-ssp     \
             --disable-multilib       \
             --disable-bootstrap      \
             --disable-fixincludes    \
             --with-system-zlib       \
             > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Check 1 ..."
echo "4. Make Check 1 ..." >> $LFSLOG_PROCESS
echo "4. Make Check 1 ..." >> $PKGLOG_ERROR
ulimit -s 32768

chown -R tester . > $PKGLOG_CHOWN 2>> $PKGLOG_ERROR

su tester -c "PATH=$PATH make $MAKEFLAGS -k check" \
  > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

../contrib/test_summary \
  >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

chown -v -R root:root                                         \
    /usr/lib/gcc/$(gcc -dumpmachine)/13.2.0/include{,-fixed}  \
    >> $PKGLOG_CHOWN 2>> $PKGLOG_ERROR

ln -sr /usr/bin/cpp /usr/lib

ln -sf ../../libexec/gcc/$(gcc -dumpmachine)/13.2.0/liblto_plugin.so  \
        /usr/lib/bfd-plugins/

echo 'int main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose &> dummy.log

echo "dummy.c" >> $PKGLOG_CHECK
cat dummy.log >> $PKGLOG_CHECK

readelf -l a.out | grep ': /lib'

echo "."  \
  >> $PKGLOG_CHECK
echo "."  \
  >> $PKGLOG_CHECK
echo "."  \
  >> $PKGLOG_CHECK

echo "grep -E -o '/usr/lib.*/S?crt[1in].*succeeded' dummy.log"  \
  >> $PKGLOG_CHECK
      grep -E -o '/usr/lib.*/S?crt[1in].*succeeded' dummy.log   \
  >> $PKGLOG_CHECK
echo "."  \
  >> $PKGLOG_CHECK

echo "grep -B4 '^ /usr/include' dummy.log"  \
  >> $PKGLOG_CHECK
      grep -B4 '^ /usr/include' dummy.log   \
  >> $PKGLOG_CHECK
echo "."  \
  >> $PKGLOG_CHECK

echo "grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'" \
  >> $PKGLOG_CHECK
      grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'  \
  >> $PKGLOG_CHECK
echo "."  \
  >> $PKGLOG_CHECK

echo "grep "/lib.*/libc.so.6 " dummy.log" \
  >> $PKGLOG_CHECK
      grep "/lib.*/libc.so.6 " dummy.log  \
  >> $PKGLOG_CHECK
echo "."  \
  >> $PKGLOG_CHECK

echo "grep found dummy.log" \
  >> $PKGLOG_CHECK
      grep found dummy.log  \
  >> $PKGLOG_CHECK
echo "."  \
  >> $PKGLOG_CHECK

rm dummy.c a.out dummy.log

mkdir -p /usr/share/gdb/auto-load/usr/lib
mv /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKGLOG_CHOWN PKG
