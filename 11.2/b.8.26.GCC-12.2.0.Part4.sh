# b.8.26.GCC-12.2.0.Part1.sh
# Sanity Check 2

export PKG="gcc-12.2.0"
export PKGLOG_DIR=$LFSLOG/8.26
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_CHOWN=$PKGLOG_DIR/chown.log

#rm -r $PKGLOG_DIR 2> /dev/null
#mkdir $PKGLOG_DIR

time { \
\
cd       build  && \
\
echo 'int main(){}' > dummy.c                       && \
cc dummy.c -v -Wl,--verbose &> dummy.log            && \
\
echo "dummy.c" >> $PKGLOG_CHECK                     && \
cat dummy.log >> $PKGLOG_CHECK                      && \
\
readelf -l a.out | grep ': /lib'                    && \
\
grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log  \
  >> $PKGLOG_CHECK                                  && \
\
grep -B4 '^ /usr/include' dummy.log                 \
  >> $PKGLOG_CHECK                                  && \
\
grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'  \
  >> $PKGLOG_CHECK                                  && \
\
grep "/lib.*/libc.so.6 " dummy.log                  \
  >> $PKGLOG_CHECK                                  && \
\
grep found dummy.log                                \
  >> $PKGLOG_CHECK                                  && \
\
rm -v dummy.c a.out dummy.log                       && \
\
mkdir -pv /usr/share/gdb/auto-load/usr/lib          && \
mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib \
\
; }

cd ..
cd ..
rm -rf $PKG
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKGLOG_CHOWN PKG
