# b.5.05.Glibc-2.36.test.sanity.check.sh
#

echo 'int main(){}' | $LFS_TGT-gcc -xc -
readelf -l a.out | grep ld-linux
rm -v a.out
