# a.6.00.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log
export LFSLOG_TIME=$LFSLOG/time.log

#####

echo "6.02.M4-1.4.19"
echo "6.02.M4-1.4.19" >> LFSLOG_PROCESS
echo "6.02.M4-1.4.19" >> LFSLOG_TIME

time {
    bash a.6.02.M4-1.4.19.sh
;} >> LFSLOG_TIME

echo "." >> LFSLOG_PROCESS
echo "." >> LFSLOG_TIME

###

echo "6.03.Ncurses-6.3"
echo "6.03.Ncurses-6.3" >> LFSLOG_PROCESS
echo "6.03.Ncurses-6.3" >> LFSLOG_TIME

time {
    bash a.6.03.Ncurses-6.3.sh
;} >> LFSLOG_TIME

echo "." >> LFSLOG_PROCESS
echo "." >> LFSLOG_TIME

###

echo "6.04.Bash-5.1.16"
echo "6.04.Bash-5.1.16" >> LFSLOG_PROCESS
echo "6.04.Bash-5.1.16" >> LFSLOG_TIME

time {
    bash a.6.04.Bash-5.1.16.sh
;} >> LFSLOG_TIME

echo "." >> LFSLOG_PROCESS
echo "." >> LFSLOG_TIME

###

echo "6.05.Coreutils-9.1"
echo "6.05.Coreutils-9.1" >> LFSLOG_PROCESS
echo "6.05.Coreutils-9.1" >> LFSLOG_TIME

time {
    bash a.6.05.Coreutils-9.1.sh
;} >> LFSLOG_TIME

echo "." >> LFSLOG_PROCESS
echo "." >> LFSLOG_TIME

###

echo "6.06.Diffutils-3.8"
echo "6.06.Diffutils-3.8" >> LFSLOG_PROCESS
echo "6.06.Diffutils-3.8" >> LFSLOG_TIME

time {
    bash a.6.06.Diffutils-3.8.sh
;} >> LFSLOG_TIME

echo "." >> LFSLOG_PROCESS
echo "." >> LFSLOG_TIME

###

echo "6.07.File-5.42"
echo "6.07.File-5.42" >> LFSLOG_PROCESS
echo "6.07.File-5.42" >> LFSLOG_TIME

time {
    bash a.6.07.File-5.42.sh
;} >> LFSLOG_TIME

echo "." >> LFSLOG_PROCESS
echo "." >> LFSLOG_TIME

###

echo "6.08.Findutils-4.9.0"
echo "6.08.Findutils-4.9.0" >> LFSLOG_PROCESS
echo "6.08.Findutils-4.9.0" >> LFSLOG_TIME

time {
    bash a.6.08.Findutils-4.9.0.sh
;} >> LFSLOG_TIME

echo "." >> LFSLOG_PROCESS
echo "." >> LFSLOG_TIME

###

echo "6.09.Gawk-5.1.1"
echo "6.09.Gawk-5.1.1" >> LFSLOG_PROCESS
echo "6.09.Gawk-5.1.1" >> LFSLOG_TIME

time {
    bash a.6.09.Gawk-5.1.1.sh
;} >> LFSLOG_TIME

echo "." >> LFSLOG_PROCESS
echo "." >> LFSLOG_TIME

###

echo "6.10.Grep-3.7"
echo "6.10.Grep-3.7" >> LFSLOG_PROCESS
echo "6.10.Grep-3.7" >> LFSLOG_TIME

time {
    bash a.6.10.Grep-3.7.sh
;} >> LFSLOG_TIME

echo "." >> LFSLOG_PROCESS
echo "." >> LFSLOG_TIME

###

echo "6.11.Gzip-1.12"
echo "6.11.Gzip-1.12" >> LFSLOG_PROCESS
echo "6.11.Gzip-1.12" >> LFSLOG_TIME

time {
    bash a.6.11.Gzip-1.12.sh
;} >> LFSLOG_TIME

echo "." >> LFSLOG_PROCESS
echo "." >> LFSLOG_TIME

###

echo "6.12.Make-4.3"
echo "6.12.Make-4.3" >> LFSLOG_PROCESS
echo "6.12.Make-4.3" >> LFSLOG_TIME

time {
    bash a.6.12.Make-4.3.sh
;} >> LFSLOG_TIME

echo "." >> LFSLOG_PROCESS
echo "." >> LFSLOG_TIME

###

echo "6.13.Patch-2.7.6"
echo "6.13.Patch-2.7.6" >> LFSLOG_PROCESS
echo "6.13.Patch-2.7.6" >> LFSLOG_TIME

time {
    bash a.6.13.Patch-2.7.6.sh
;} >> LFSLOG_TIME

echo "." >> LFSLOG_PROCESS
echo "." >> LFSLOG_TIME

###

echo "6.14.Sed-4.8"
echo "6.14.Sed-4.8" >> LFSLOG_PROCESS
echo "6.14.Sed-4.8" >> LFSLOG_TIME

time {
    bash a.6.14.Sed-4.8..sh
;} >> LFSLOG_TIME

echo "." >> LFSLOG_PROCESS
echo "." >> LFSLOG_TIME

###

echo "6.15.Tar-1.34"
echo "6.15.Tar-1.34" >> LFSLOG_PROCESS
echo "6.15.Tar-1.34" >> LFSLOG_TIME

time {
    bash a.6.15.Tar-1.34.sh
;} >> LFSLOG_TIME

echo "." >> LFSLOG_PROCESS
echo "." >> LFSLOG_TIME

###

echo "6.16.Xz-5.2.6"
echo "6.16.Xz-5.2.6" >> LFSLOG_PROCESS
echo "6.16.Xz-5.2.6" >> LFSLOG_TIME

time {
    bash a.6.16.Xz-5.2.6.sh
;} >> LFSLOG_TIME

echo "." >> LFSLOG_PROCESS
echo "." >> LFSLOG_TIME

###

echo "6.17.Binutils-2.39-Pass2"
echo "6.17.Binutils-2.39-Pass2" >> LFSLOG_PROCESS
echo "6.17.Binutils-2.39-Pass2" >> LFSLOG_TIME

time {
    bash a.6.17.Binutils-2.39-Pass2.sh
;} >> LFSLOG_TIME

echo "." >> LFSLOG_PROCESS
echo "." >> LFSLOG_TIME

###

echo "6.18.GCC-12.2.0-Pass2"
echo "6.18.GCC-12.2.0-Pass2" >> LFSLOG_PROCESS
echo "6.18.GCC-12.2.0-Pass2" >> LFSLOG_TIME

time {
    bash a.6.18.GCC-12.2.0-Pass2.sh
;} >> LFSLOG_TIME

echo "." >> LFSLOG_PROCESS
echo "." >> LFSLOG_TIME

#####

unset LFSLOG_TIME
unset LFSLOG_PROCESS