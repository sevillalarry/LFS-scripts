# a.12.00.sh
#
# Clean Up  Based on:
#
#   https://www.linuxfromscratch.org/blfs/view/11.3/introduction/notes-on-building.html
#   https://www.linuxfromscratch.org/blfs/view/11.3/introduction/la-files.html
#   https://www.linuxfromscratch.org/blfs/view/11.3/introduction/locale-issues.html
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "12.01.strip-all"
echo "12.01.strip-all" >> $LFSLOG_PROCESS

time { bash a.12.01.strip-all.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "12.05.remove-la-files"
echo "12.05.remove-la-files" >> $LFSLOG_PROCESS

time { bash a.12.05.remove-la-files.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "12.07.checkman"
echo "12.07.checkman" >> $LFSLOG_PROCESS

time { bash a.12.07.checkman.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
