# b.8.05.Glibc-2.36.Part1.sh
# Extract, Configure, Build, Check

export PKG="glibc-2.36"
export PKGLOG_DIR=$LFSLOG/8.05
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

#Modify the next line for your local time zone
#export LOCAL_TIME_ZONE=Asia/Manila                                && \

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
make check > $PKGLOG_CHECK 2>> $PKGLOG_ERROR        \
\
; }

#unset LOCAL_TIME_ZONE

cd ..
cd ..
#rm -rf $PKG
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
