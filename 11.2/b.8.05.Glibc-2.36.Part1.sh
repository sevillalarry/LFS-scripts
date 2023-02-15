# b.8.05.Glibc-2.36.Part1.sh
#

export PKG="glibc-2.36"
export PKGLOG_DIR=$LFSLOG/8.05
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log

mkdir $PKGLOG_DIR

echo "1. Extract tar..."
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2> $PKGLOG_ERROR
cd $PKG

#Modify the next line for your local time zone
export LOCAL_TIME_ZONE=Asia/Manila                                && \

time { \
\
patch -Np1 -i ../glibc-2.36-fhs-1.patch             && \
patch -Np1 -i ../glibc-2.36-security_fix-1.patch    && \
\
mkdir -v build                              && \
cd       build                              && \
\
echo "rootsbindir=/usr/sbin" > configparms  && \
\
echo "2. Configure ..."                     && \
../configure --prefix=/usr                      \
             --disable-werror                   \
             --enable-kernel=3.2                \
             --enable-stack-protector=strong    \
             --with-headers=/usr/include        \
             libc_cv_slibdir=/usr/lib           \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR      && \
\
echo "3. Make Build ..."                && \
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR  && \
\
echo "4. Make Check ..."                && \
make check > $PKGLOG_CHECK 2>> $PKGLOG_ERROR        && \
\
touch /etc/ld.so.conf                   && \
\
sed '/test-installation/s@$(PERL)@echo not running@' -i ../Makefile   && \
\
echo "5. Make Install ..."              && \
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR    && \
\
sed '/RTLDLIST=/s@/usr@@g' -i /usr/bin/ldd  && \
\
cp -v ../nscd/nscd.conf /etc/nscd.conf      && \
mkdir -pv /var/cache/nscd                   && \
\
echo "6. Locale Definitions ..."            && \
mkdir -pv /usr/lib/locale                                       && \
localedef -i POSIX -f UTF-8 C.UTF-8 2> /dev/null || true        && \
localedef -i cs_CZ -f UTF-8 cs_CZ.UTF-8                         && \
localedef -i de_DE -f ISO-8859-1 de_DE                          && \
localedef -i de_DE@euro -f ISO-8859-15 de_DE@euro               && \
localedef -i de_DE -f UTF-8 de_DE.UTF-8                         && \
localedef -i el_GR -f ISO-8859-7 el_GR                          && \
localedef -i en_GB -f ISO-8859-1 en_GB                          && \
localedef -i en_GB -f UTF-8 en_GB.UTF-8                         && \
localedef -i en_HK -f ISO-8859-1 en_HK                          && \
localedef -i en_PH -f ISO-8859-1 en_PH                          && \
localedef -i en_US -f ISO-8859-1 en_US                          && \
localedef -i en_US -f UTF-8 en_US.UTF-8                         && \
localedef -i es_ES -f ISO-8859-15 es_ES@euro                    && \
localedef -i es_MX -f ISO-8859-1 es_MX                          && \
localedef -i fa_IR -f UTF-8 fa_IR                               && \
localedef -i fr_FR -f ISO-8859-1 fr_FR                          && \
localedef -i fr_FR@euro -f ISO-8859-15 fr_FR@euro               && \
localedef -i fr_FR -f UTF-8 fr_FR.UTF-8                         && \
localedef -i is_IS -f ISO-8859-1 is_IS                          && \
localedef -i is_IS -f UTF-8 is_IS.UTF-8                         && \
localedef -i it_IT -f ISO-8859-1 it_IT                          && \
localedef -i it_IT -f ISO-8859-15 it_IT@euro                    && \
localedef -i it_IT -f UTF-8 it_IT.UTF-8                         && \
localedef -i ja_JP -f EUC-JP ja_JP                              && \
localedef -i ja_JP -f SHIFT_JIS ja_JP.SJIS 2> /dev/null || true && \
localedef -i ja_JP -f UTF-8 ja_JP.UTF-8                         && \
localedef -i nl_NL@euro -f ISO-8859-15 nl_NL@euro               && \
localedef -i ru_RU -f KOI8-R ru_RU.KOI8-R                       && \
localedef -i ru_RU -f UTF-8 ru_RU.UTF-8                         && \
localedef -i se_NO -f UTF-8 se_NO.UTF-8                         && \
localedef -i ta_IN -f UTF-8 ta_IN.UTF-8                         && \
localedef -i tr_TR -f UTF-8 tr_TR.UTF-8                         && \
localedef -i zh_CN -f GB18030 zh_CN.GB18030                     && \
localedef -i zh_HK -f BIG5-HKSCS zh_HK.BIG5-HKSCS               && \
localedef -i zh_TW -f UTF-8 zh_TW.UTF-8                         && \
\
echo "7. Make Install Locales ..."                              && \
make localedata/install-locales \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR && \
\
localedef -i POSIX -f UTF-8 C.UTF-8 2> /dev/null || true        && \
localedef -i ja_JP -f SHIFT_JIS ja_JP.SJIS 2> /dev/null || true && \
\
echo "8. Setting Time Zone ..."     && \
tar -xf ../../tzdata2022c.tar.gz    \
    >> $PKGLOG_TAR 2> $PKGLOG_ERROR && \
\
ZONEINFO=/usr/share/zoneinfo        && \
mkdir -pv $ZONEINFO/{posix,right}   && \
\
for tz in etcetera southamerica northamerica europe africa antarctica  \
          asia australasia backward; do
    zic -L /dev/null   -d $ZONEINFO       ${tz}
    zic -L /dev/null   -d $ZONEINFO/posix ${tz}
    zic -L leapseconds -d $ZONEINFO/right ${tz}
done      && \
\
cp -v zone.tab zone1970.tab iso3166.tab $ZONEINFO     && \
zic -d $ZONEINFO -p $LOCAL_TIME_ZONE                  && \
unset ZONEINFO                                        && \
\
ln -sfv /usr/share/zoneinfo/$LOCAL_TIME_ZONE /etc/localtime   \
\
; }

unset LOCAL_TIME_ZONE

cd ..
cd ..
rm -rf $PKG
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
