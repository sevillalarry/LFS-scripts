# b.8.09.Zstd-1.5.2.sh
#

export PKG="zstd-1.5.2"
tar xvf $PKG.tar.gz
cd $PKG

time { \
\
patch -Np1 -i ../zstd-1.5.2-upstream_fixes-1.patch  && \
\
make PREFIX=/usr            && \
\
make check                  && \
\
make PREFIX=/usr install    && \
\
rm -v /usr/lib/libzstd.a       \
\
; }

cd ..
rm -rf $PKG
unset PKG
