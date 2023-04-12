# a.08.00.Part2.26-34.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.26.GCC-12.2.0"
echo "08.26.GCC-12.2.0" >> $LFSLOG_PROCESS

time { bash a.08.26.GCC-12.2.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.27.Pkg-config-0.29.2"
echo "08.27.Pkg-config-0.29.2" >> $LFSLOG_PROCESS

time { bash a.08.27.Pkg-config-0.29.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.28.Ncurses-6.4"
echo "08.28.Ncurses-6.4" >> $LFSLOG_PROCESS

time { bash a.08.28.Ncurses-6.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.29.Sed-4.9"
echo "08.29.Sed-4.9" >> $LFSLOG_PROCESS

time { bash a.08.29.Sed-4.9.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.30.Psmisc-23.6"
echo "08.30.Psmisc-23.6" >> $LFSLOG_PROCESS

time { bash a.08.30.Psmisc-23.6.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.31.Gettext-0.21.1"
echo "08.31.Gettext-0.21.1" >> $LFSLOG_PROCESS

time { bash a.08.31.Gettext-0.21.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.32.Bison-3.8.2"
echo "08.32.Bison-3.8.2" >> $LFSLOG_PROCESS

time { bash a.08.32.Bison-3.8.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.33.Grep-3.8"
echo "08.33.Grep-3.8" >> $LFSLOG_PROCESS

time { bash a.08.33.Grep-3.8.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.34.Bash-5.2.15.Part1"
echo "08.34.Bash-5.2.15.Part1" >> $LFSLOG_PROCESS

time { bash a.08.34.Bash-5.2.15.Part1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.34.Bash-5.2.15.Part9"
echo "08.34.Bash-5.2.15.Part9" >> $LFSLOG_PROCESS

bash a.08.34.Bash-5.2.15.Part9.sh

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
