# b.8.25.Shadow-4.12.2.sh
#

export PKG="shadow-4.12.2"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
sed -i 's/groups$(EXEEXT) //' src/Makefile.in                   && \
find man -name Makefile.in -exec sed -i 's/groups\.1 / /'   {}  && \
find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {}  && \
find man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {}  && \
\
sed -e 's:#ENCRYPT_METHOD DES:ENCRYPT_METHOD SHA512:' \
    -e 's:/var/spool/mail:/var/mail:'                 \
    -e '/PATH=/{s@/sbin:@@;s@/bin:@@}'                \
    -i etc/login.defs                               && \
\
touch /usr/bin/passwd                               && \
\
./configure --sysconfdir=/etc \
            --disable-static  \
            --with-group-name-max-length=32         && \
\
make    && \
\
make exec_prefix=/usr install   && \
make -C man install-man         \
\
; }

cd ..
rm -rf $PKG
unset PKG
