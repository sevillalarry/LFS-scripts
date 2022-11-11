# b.8.26.GCC-12.2.0.Part3.sh
#

export PKG="gcc-12.2.0"
#tar xvf $PKG.tar.xz
cd $PKG
cd build

time { \
\
make install    && \
\
chown -v -R root:root \
    /usr/lib/gcc/$(gcc -dumpmachine)/12.2.0/include{,-fixed}    && \
\
ln -svr /usr/bin/cpp /usr/lib   && \
\
ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/12.2.0/liblto_plugin.so \
        /usr/lib/bfd-plugins/   \
\
; }

cd ..
cd ..
#rm -rf $PKG
unset PKG
