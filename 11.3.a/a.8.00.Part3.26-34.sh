# a.8.00.Part3.26-76.sh
# exludes 8.60 GRUB

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "8.26.GCC-12.2.0"
echo "8.26.GCC-12.2.0" >> $LFSLOG_PROCESS

time { bash a.8.26.GCC-12.2.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "8.27.Pkg-config-0.29.2"
echo "8.27.Pkg-config-0.29.2" >> $LFSLOG_PROCESS

time { bash a.8.27.Pkg-config-0.29.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "8.28.Ncurses-6.4"
echo "8.28.Ncurses-6.4" >> $LFSLOG_PROCESS

time { bash a.8.28.Ncurses-6.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "8.29.Sed-4.9"
echo "8.29.Sed-4.9" >> $LFSLOG_PROCESS

time { bash a.8.29.Sed-4.9.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "8.30.Psmisc-23.6"
echo "8.30.Psmisc-23.6" >> $LFSLOG_PROCESS

time { bash a.8.30.Psmisc-23.6.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "8.31.Gettext-0.21.1"
echo "8.31.Gettext-0.21.1" >> $LFSLOG_PROCESS

time { bash a.8.31.Gettext-0.21.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "8.32.Bison-3.8.2"
echo "8.32.Bison-3.8.2" >> $LFSLOG_PROCESS

time { bash a.8.32.Bison-3.8.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "8.33.Grep-3.8"
echo "8.33.Grep-3.8" >> $LFSLOG_PROCESS

time { bash a.8.33.Grep-3.8.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "8.34.Bash-5.2.15.Part1"
echo "8.34.Bash-5.2.15.Part1" >> $LFSLOG_PROCESS

time { bash a.8.34.Bash-5.2.15.Part1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "8.34.Bash-5.2.15.Part9"
echo "8.34.Bash-5.2.15.Part9" >> $LFSLOG_PROCESS

bash a.8.34.Bash-5.2.15.Part1.sh ; }

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
