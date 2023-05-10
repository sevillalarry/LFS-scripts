# a.08.00.Part7.90.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

###

echo "7.13.pause.Backup"
echo "7.13.pause.Backup" >> $LFSLOG_PROCESS

bash a.07.13.pause.Backup.sh
bash a.08.90.for.78.n.79.Stripping.n.Cleaning.Up.sh
echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
