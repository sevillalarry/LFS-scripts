# a.5.00.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "5.02.Binutils-2.40-Pass1"
echo "5.02.Binutils-2.40-Pass1" >> $LFSLOG_PROCESS

time { bash a.5.02.Binutils-2.40-Pass1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "5.03.GCC-12.2.0-Pass1"
echo "5.03.GCC-12.2.0-Pass1" >> $LFSLOG_PROCESS

time { bash a.5.03.GCC-12.2.0-Pass1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "5.04.Linux-6.1.22.API.Headers"
echo "5.04.Linux-6.1.22.API.Headers" >> $LFSLOG_PROCESS

time { bash a.5.04.Linux-6.1.22.API.Headers.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "5.05.Glibc-2.37"
echo "5.05.Glibc-2.37" >> $LFSLOG_PROCESS

time { bash a.5.05.Glibc-2.37.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "5.06.Libstdc++.from.GCC-12.2.0"
echo "5.06.Libstdc++.from.GCC-12.2.0" >> $LFSLOG_PROCESS

time { bash a.5.06.Libstdc++.from.GCC-12.2.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
