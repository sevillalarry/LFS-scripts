# b.8.26.GCC-12.2.0.Part2.sh
#

export PKG="GCC-12.2.0"
#tar xvf $PKG.tar.xz
cd $PKG
cd build

time { \
\
ulimit -s 32768     && \
\
chown -Rv tester .  && \
su tester -c "PATH=$PATH make -k check"   && \
\
../contrib/test_summary   \
\
; }

cd ..
cd ..
#rm -rf $PKG
unset PKG
