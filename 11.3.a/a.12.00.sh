# a.12.00.sh
#
# Clean Up  Based on:
#
#   https://www.linuxfromscratch.org/lfs/view/11.3/chapter08/stripping.html
#   https://www.linuxfromscratch.org/lfs/view/11.3/chapter08/cleanup.html
#
#   https://www.linuxfromscratch.org/blfs/view/11.3/introduction/notes-on-building.html
#   https://www.linuxfromscratch.org/blfs/view/11.3/introduction/la-files.html
#   https://www.linuxfromscratch.org/blfs/view/11.3/introduction/locale-issues.html
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "12.01.Stripping"
echo "12.01.Stripping" >> $LFSLOG_PROCESS

time { bash a.12.01.Stripping.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "12.02.Cleaning.Up"
echo "12.02.Cleaning.Up" >> $LFSLOG_PROCESS

time { bash a.12.02.Cleaning.Up.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "12.11.strip-all"
echo "12.11.strip-all" >> $LFSLOG_PROCESS

time { bash a.12.11.strip-all.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "12.15.remove-la-files"
echo "12.15.remove-la-files" >> $LFSLOG_PROCESS

time { bash a.12.15.remove-la-files.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "12.17.checkman"
echo "12.17.checkman" >> $LFSLOG_PROCESS

time { bash a.12.17.checkman.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
