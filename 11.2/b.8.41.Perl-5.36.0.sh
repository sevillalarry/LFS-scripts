# b.8.41.Perl-5.36.0.sh
#

export PKG="perl-5.36.0"
export PKGLOG_DIR=$LFSLOG/8.41
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

export BUILD_ZLIB=False
export BUILD_BZIP2=0

time { \
\
echo "2. Configure ..."     && \
sh Configure -des                                           \
             -Dprefix=/usr                                  \
             -Dvendorprefix=/usr                            \
             -Dprivlib=/usr/lib/perl5/5.36/core_perl        \
             -Darchlib=/usr/lib/perl5/5.36/core_perl        \
             -Dsitelib=/usr/lib/perl5/5.36/site_perl        \
             -Dsitearch=/usr/lib/perl5/5.36/site_perl       \
             -Dvendorlib=/usr/lib/perl5/5.36/vendor_perl    \
             -Dvendorarch=/usr/lib/perl5/5.36/vendor_perl   \
             -Dman1dir=/usr/share/man/man1                  \
             -Dman3dir=/usr/share/man/man3                  \
             -Dpager="/usr/bin/less -isR"                   \
             -Duseshrplib                                   \
             -Dusethreads                                   \
             > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR             && \
\
echo "3. Make Build ..."                && \
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR  && \
\
echo "4. Make Check ..."                && \
make test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR         && \
\
echo "5. Make Install ..."              && \
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR    \
\
; }

unset BUILD_ZLIB BUILD_BZIP2

cd ..
rm -rf $PKG
unset PKGLOG_ERROR PKGLOG_INSTALL PKGLOG_CHECK
unset PKGLOG_BUILD PKGLOG_CONFIG PKGLOG_TAR
unset PKGLOG_DIR PKG
