# b.8.26.GCC-12.2.0.Part1.sh
#

export PKG="gcc-12.2.0"
export PKGLOG_DIR=$LFSLOG/8.26
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2> $PKGLOG_ERROR
cd $PKG

time { \
\
case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
  ;;
esac            && \
\
mkdir -v build  && \
cd       build  && \
\
echo "2. Configure ..."                 && \
../configure --prefix=/usr              \
             LD=ld                      \
             --enable-languages=c,c++   \
             --disable-multilib         \
             --disable-bootstrap        \
             --with-system-zlib         \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR  && \
\
echo "3. Make Build ..."                && \
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR  && \
\
echo "4. Make Check ..."                && \
ulimit -s 32768     && \
\
chown -Rv tester .  && \
su tester -c "PATH=$PATH make -k check" \
  > $PKGLOG_CHECK 2>> $PKGLOG_ERROR     && \
\
../contrib/test_summary   \
  >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR    && \
\
echo "5. Make Install ..."              && \
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR  && \
\
chown -v -R root:root \
    /usr/lib/gcc/$(gcc -dumpmachine)/12.2.0/include{,-fixed}    && \
\
ln -svr /usr/bin/cpp /usr/lib   && \
\
ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/12.2.0/liblto_plugin.so \
        /usr/lib/bfd-plugins/   \
\
; }

# Sanity Checks
echo 'int main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose &> dummy.log

echo "dummy.c" >> $PKGLOG_CHECK
cat dummy.log >> $PKGLOG_CHECK

readelf -l a.out | grep ': /lib'

grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log  \
  >> $PKGLOG_CHECK

grep -B4 '^ /usr/include' dummy.log \
  >> $PKGLOG_CHECK

grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'  \
  >> $PKGLOG_CHECK

grep "/lib.*/libc.so.6 " dummy.log  \
  >> $PKGLOG_CHECK

grep found dummy.log  \
  >> $PKGLOG_CHECK

rm -v dummy.c a.out dummy.log

mkdir -pv /usr/share/gdb/auto-load/usr/lib
mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib

cd ..
cd ..
rm -rf $PKG
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
