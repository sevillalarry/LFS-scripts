# b.8.26.GCC-12.2.0.Part1.sh
#

export PKG="gcc-12.2.0"
#tar xvf $PKG.tar.xz
cd $PKG
cd build

rm -v dummy.c a.out dummy.log

mkdir -pv /usr/share/gdb/auto-load/usr/lib
mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib

cd ..
cd ..
rm -rf $PKG
unset PKG
