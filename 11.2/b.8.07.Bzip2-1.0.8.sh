# b.8.07.Bzip2-1.0.8.sh
#

export PKG="bzip2-1.0.8"
tar xvf $PKG.tar.gz
cd $PKG

time { \
\
patch -Np1 -i ../bzip2-1.0.8-install_docs-1.patch       && \
\
sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile     && \
\
sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile   && \
\
make -f Makefile-libbz2_so  && \
make clean                  && \
\
make                        && \
\
make PREFIX=/usr install    && \
\
cp -av libbz2.so.* /usr/lib && \
ln -sv libbz2.so.1.0.8 /usr/lib/libbz2.so   \
\
; }

cd ..
rm -rf $PKG
unset PKG
