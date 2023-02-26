# b.8.57.Gawk-5.1.1.sh
#

export PKG="gawk-5.1.1"
export PKGLOG_DIR=$LFSLOG/8.57
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
sed -i 's/extras//' Makefile.in    && \
\
echo "2. Configure ..."            && \
./configure --prefix=/usr          \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR    && \
\
echo "3. Make Build ..."                && \
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR  && \
\
echo "4. Make Check ..."                && \
make check                              \
     > $PKGLOG_CHECK 2>> $PKGLOG_ERROR  && \
\
echo "5. Make Install ..."              && \
make install                                 \
     > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR     && \
\
mkdir -pv                                    \
     /usr/share/doc/gawk-5.1.1               && \
cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}}  \
     /usr/share/doc/gawk-5.1.1               \
\
; }

cd ..
rm -rf $PKG
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
