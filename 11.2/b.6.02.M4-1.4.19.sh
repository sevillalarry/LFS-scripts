# b.6.02.M4-1.4.19.sh
#

tar xvf m4-1.4.19.tar.xz
cd m4-1.4.19

time { \
\
./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)  && \
\
make && \
\
make DESTDIR=$LFS install \
\
; }

cd ..
rm -rf m4-1.4.19
