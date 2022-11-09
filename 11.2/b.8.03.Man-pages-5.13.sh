# b.8.03.Man-pages-5.13.sh
#

export PKG="man-pages-5.13"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
make prefix=/usr install \
\
; }

cd ..
rm -rf $PKG
unset PKG
