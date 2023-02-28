# a.5.00.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log
export LFSLOG_TIME=$LFSLOG/time.log

#####

echo "5.02.Binutils-2.39-Pass1"
echo "5.02.Binutils-2.39-Pass1" >> LFSLOG_PROCESS
echo "5.02.Binutils-2.39-Pass1" >> LFSLOG_TIME

time {
    bash a.5.02.Binutils-2.39-Pass1.sh
;} >> LFSLOG_TIME

echo "." >> LFSLOG_PROCESS
echo "." >> LFSLOG_TIME

###

echo "5.03.GCC-12.2.0-Pass1"
echo "5.03.GCC-12.2.0-Pass1" >> LFSLOG_PROCESS
echo "5.03.GCC-12.2.0-Pass1" >> LFSLOG_TIME

time {
    bash a.5.03.GCC-12.2.0-Pass1.sh
;} >> LFSLOG_TIME

echo "." >> LFSLOG_PROCESS
echo "." >> LFSLOG_TIME

###

echo "5.04.Linux-5.15.91.API.Headers"
echo "5.04.Linux-5.15.91.API.Headers" >> LFSLOG_PROCESS
echo "5.04.Linux-5.15.91.API.Headers" >> LFSLOG_TIME

time {
    bash a.5.04.Linux-5.15.91.API.Headers.sh
;} >> LFSLOG_TIME

echo "." >> LFSLOG_PROCESS
echo "." >> LFSLOG_TIME

###

echo "5.05.Glibc-2.36"
echo "5.05.Glibc-2.36" >> LFSLOG_PROCESS
echo "5.05.Glibc-2.36" >> LFSLOG_TIME

time {
    bash a.5.05.Glibc-2.36.sh
;} >> LFSLOG_TIME

echo "." >> LFSLOG_PROCESS
echo "." >> LFSLOG_TIME

#####

unset LFSLOG_TIME
unset LFSLOG_PROCESS