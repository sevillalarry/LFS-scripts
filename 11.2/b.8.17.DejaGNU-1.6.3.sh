# b.8.17.DejaGNU-1.6.3.sh
#

export PKG="dejagnu-1.6.3"
export PKGLOG_DIR=$LFSLOG/8.17
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
#export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log

mkdir $PKGLOG_DIR

echo "1. Extract tar..."
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2> $PKGLOG_ERROR
cd $PKG

time { \
\
mkdir -v build  && \
cd       build  && \
\
echo "2. Configure ..."         && \
../configure --prefix=/usr > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR&&     && \
makeinfo --html --no-split -o doc/dejagnu.html ../doc/dejagnu.texi  && \
makeinfo --plaintext       -o doc/dejagnu.txt  ../doc/dejagnu.texi  && \
\
echo "3. Make Build & Install..."                   && \
make install > $PKGLOG_BUILD 2>> $PKGLOG_ERROR      && \
install -v -dm755  /usr/share/doc/dejagnu-1.6.3     && \
install -v -m644   doc/dejagnu.{html,txt} \
    /usr/share/doc/dejagnu-1.6.3                    && \
\
echo "4. Make Check ..."                            && \
make check > $PKGLOG_CHECK 2>> $PKGLOG_ERROR        \
\
; }

cd ..
cd ..
rm -rf $PKG
unset PKGLOG_ERROR PKGLOG_CHECK
# PKGLOG_INSTALL
unset PKGLOG_BUILD PKGLOG_CONFIG PKGLOG_TAR
unset PKGLOG_DIR PKG
