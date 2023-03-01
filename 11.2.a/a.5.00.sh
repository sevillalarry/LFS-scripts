# a.5.00.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

#####

echo "5.02.Binutils-2.39-Pass1"
echo "5.02.Binutils-2.39-Pass1" >> $LFSLOG_PROCESS

time { bash a.5.02.Binutils-2.39-Pass1.sh ; }

echo "." >> $LFSLOG_PROCESS

###

echo "5.03.GCC-12.2.0-Pass1"
echo "5.03.GCC-12.2.0-Pass1" >> $LFSLOG_PROCESS

time { bash a.5.03.GCC-12.2.0-Pass1.sh ; }

echo "." >> $LFSLOG_PROCESS

###

echo "5.04.Linux-5.15.91.API.Headers"
echo "5.04.Linux-5.15.91.API.Headers" >> $LFSLOG_PROCESS

time { bash a.5.04.Linux-5.15.91.API.Headers.sh ; }

echo "." >> $LFSLOG_PROCESS

###

echo "5.05.Glibc-2.36"
echo "5.05.Glibc-2.36" >> $LFSLOG_PROCESS

time { bash a.5.05.Glibc-2.36.sh ; }

echo "." >> $LFSLOG_PROCESS

#####

unset LFSLOG_PROCESS
