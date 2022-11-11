# b.8.24.Libcap-2.65.sh
#

export PKG="libcap-2.65"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
sed -i '/install -m.*STA/d' libcap/Makefile     && \
\
make prefix=/usr lib=lib        && \
\
make test                       && \
\
make prefix=/usr lib=lib install    \
\
; }

cd ..
rm -rf $PKG
unset PKG
