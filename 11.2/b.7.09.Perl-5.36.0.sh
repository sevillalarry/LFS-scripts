# b.7.09.Perl-5.36.0.sh
#

export PKG="perl-5.36.0"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
sh Configure -des                                        \
             -Dprefix=/usr                               \
             -Dvendorprefix=/usr                         \
             -Dprivlib=/usr/lib/perl5/5.36/core_perl     \
             -Darchlib=/usr/lib/perl5/5.36/core_perl     \
             -Dsitelib=/usr/lib/perl5/5.36/site_perl     \
             -Dsitearch=/usr/lib/perl5/5.36/site_perl    \
             -Dvendorlib=/usr/lib/perl5/5.36/vendor_perl \
             -Dvendorarch=/usr/lib/perl5/5.36/vendor_perl && \
\
make && \
\
make install \
\
; }

cd ..
rm -rf $PKG
unset PKG
