# b.6.04.Bash-5.1.16.sh
#

export PKG="bash-5.1.16"
tar xvf $PKG.tar.gz
cd $PKG

time { \
\
./configure --prefix=/usr                   \
            --build=$(support/config.guess) \
            --host=$LFS_TGT                 \
            --without-bash-malloc        && \
\
make && \
\
make DESTDIR=$LFS install     && \
ln -sv bash $LFS/bin/sh          \
\
; }

cd ..
rm -rf $PKG
unset PKG
