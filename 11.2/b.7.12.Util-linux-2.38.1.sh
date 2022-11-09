# b.7.12.Util-linux-2.38.1.sh
#

export PKG="util-linux-2.38.1"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
mkdir -pv /var/lib/hwclock  && \
\
./configure ADJTIME_PATH=/var/lib/hwclock/adjtime    \
            --libdir=/usr/lib    \
            --docdir=/usr/share/doc/util-linux-2.38.1 \
            --disable-chfn-chsh  \
            --disable-login      \
            --disable-nologin    \
            --disable-su         \
            --disable-setpriv    \
            --disable-runuser    \
            --disable-pylibmount \
            --disable-static     \
            --without-python     \
            runstatedir=/run  && \
\
make && \
\
make install \
\
; }

cd ..
rm -rf $PKG
unset PKG
