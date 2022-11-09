tar xvf linux-5.15.76.tar.xz
cd linux-5.15.76

time { \
\
make mrproper && \
make headers  && \
find usr/include -type f ! -name '*.h' -delete && \
cp -rv usr/include $LFS/usr \
\
; }

cd ..
rm -rf linux-5.15.76
