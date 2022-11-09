# b.6.07.File-5.42.sh
#

export PKG="file-5.42"
tar xvf $PKG.tar.gz
cd $PKG

time { \
\
mkdir build                         && \
pushd build                         && \
  ../configure --disable-bzlib      \
               --disable-libseccomp \
               --disable-xzlib      \
               --disable-zlib       && \
  make                              && \
popd                                && \
\
./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess) && \
\
make FILE_COMPILE=$(pwd)/build/src/file && \
\
make DESTDIR=$LFS install               && \
\
rm -v $LFS/usr/lib/libmagic.la          \
; }

cd ..
rm -rf $PKG
unset PKG
