# b.5.04.Linux-5.19.2.API.Headers.sh
#

export PKG="linux-5.15.76"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
make mrproper                                   && \
\
make headers                                    && \
find usr/include -type f ! -name '*.h' -delete  && \
cp -rv usr/include $LFS/usr                     \
\
; }

cd ..
rm -rf $PKG
unset PKG
