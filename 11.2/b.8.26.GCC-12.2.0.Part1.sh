# b.8.26.GCC-12.2.0.Part1.sh
#

export PKG="gcc-12.2.0"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
  ;;
esac            && \
\
mkdir -v build  && \
cd       build  && \
\
../configure --prefix=/usr            \
             LD=ld                    \
             --enable-languages=c,c++ \
             --disable-multilib       \
             --disable-bootstrap      \
             --with-system-zlib     && \
\
make \
\
; }

cd ..
cd ..
#rm -rf $PKG
unset PKG
