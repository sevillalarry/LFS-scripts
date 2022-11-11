# b.8.23.Acl-2.3.1.sh
#

export PKG="acl-2.3.1"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
./configure --prefix=/usr         \
            --disable-static      \
            --docdir=/usr/share/doc/acl-2.3.1   && \
\
make            && \
\
make install    \
\
; }

cd ..
rm -rf $PKG
unset PKG
