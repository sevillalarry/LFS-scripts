# a.08.00.Part3.35-49.sh
# 
# upto libffi as of this time
# Python to meson: one at a time

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.35.Libtool-2.4.7"
echo "08.35.Libtool-2.4.7" >> $LFSLOG_PROCESS

time { bash a.08.35.Libtool-2.4.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.36.GDBM-1.23"
echo "08.36.GDBM-1.23" >> $LFSLOG_PROCESS

time { bash a.08.36.GDBM-1.23.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.37.Gperf-3.1"
echo "08.37.Gperf-3.1" >> $LFSLOG_PROCESS

time { bash a.08.37.Gperf-3.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.38.Expat-2.5.0"
echo "08.38.Expat-2.5.0" >> $LFSLOG_PROCESS

time { bash a.08.38.Expat-2.5.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.39.Inetutils-2.4"
echo "08.39.Inetutils-2.4" >> $LFSLOG_PROCESS

time { bash a.08.39.Inetutils-2.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.40.Less-608"
echo "08.40.Less-608" >> $LFSLOG_PROCESS

time { bash a.08.40.Less-608.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.41.Perl-5.36.0"
echo "08.41.Perl-5.36.0" >> $LFSLOG_PROCESS

time { bash a.08.41.Perl-5.36.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.42.XML-Parser-2.46"
echo "08.42.XML-Parser-2.46" >> $LFSLOG_PROCESS

time { bash a.08.42.XML-Parser-2.46.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.43.Intltool-0.51.0"
echo "08.43.Intltool-0.51.0" >> $LFSLOG_PROCESS

time { bash a.08.43.Intltool-0.51.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.44.Autoconf-2.71"
echo "08.44.Autoconf-2.71" >> $LFSLOG_PROCESS

time { bash a.08.44.Autoconf-2.71.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.45.Automake-1.16.5"
echo "08.45.Automake-1.16.5" >> $LFSLOG_PROCESS

time { bash a.08.45.Automake-1.16.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.46.OpenSSL-3.0.8"
echo "08.46.OpenSSL-3.0.8" >> $LFSLOG_PROCESS

time { bash a.08.46.OpenSSL-3.0.8.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.47.Kmod-30"
echo "08.47.Kmod-30" >> $LFSLOG_PROCESS

time { bash a.08.47.Kmod-30.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.48.Libelf.from.Elfutils-0.188"
echo "08.48.Libelf.from.Elfutils-0.188" >> $LFSLOG_PROCESS

time { bash a.08.48.Libelf.from.Elfutils-0.188.sh; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.49.Libffi-3.4.4"
echo "08.49.Libffi-3.4.4" >> $LFSLOG_PROCESS

time { bash a.08.49.Libffi-3.4.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
