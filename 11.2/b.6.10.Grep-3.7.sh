# b.6.10.Grep-3.7.sh
#

export PKG="grep-3.7"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
./configure --prefix=/usr   \
            --host=$LFS_TGT && \
\
make && \
\
make DESTDIR=$LFS install \
\
; }

cd ..
rm -rf $PKG
unset PKG
