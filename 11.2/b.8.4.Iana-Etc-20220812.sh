# b.8.4.Iana-Etc-20220812.sh
#

export PKG="iana-etc-20220812"
tar xvf $PKG.tar.gz
cd $PKG

time { \
\
cp services protocols /etc  \
\
; }

cd ..
rm -rf $PKG
unset PKG
