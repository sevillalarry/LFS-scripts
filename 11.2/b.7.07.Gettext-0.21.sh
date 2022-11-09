# b.7.07.Gettext-0.21.sh
#

export PKG="gettext-0.21"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
./configure --disable-shared     && \
\
make && \
\
cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin  \
\
; }

cd ..
rm -rf $PKG
unset PKG
