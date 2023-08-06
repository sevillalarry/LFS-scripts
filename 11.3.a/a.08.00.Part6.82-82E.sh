# a.08.00.Part6.82-82C.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.82.misc"
echo "08.82.misc" >> $LFSLOG_PROCESS

bash a.08.82.misc.sh ;

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.82A.Lynx-2.8.9rel.1"
echo "08.82A.Lynx-2.8.9rel.1" >> $LFSLOG_PROCESS

time { bash a.08.82A.Lynx-2.8.9rel.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.82B.GPM-1.20.7"
echo "08.82B.GPM-1.20.7" >> $LFSLOG_PROCESS

time { bash a.08.82B.GPM-1.20.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.82C.OpenSSH-9.3p2"
echo "08.82C.OpenSSH-9.3p2" >> $LFSLOG_PROCESS

time { bash a.08.82C.OpenSSH-9.3p2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.82D.acpid-2.0.34"
echo "08.82D.acpid-2.0.34" >> $LFSLOG_PROCESS

time { bash a.08.82D.acpid-2.0.34.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.82E.Sudo-1.9.13p1"
echo "08.82E.Sudo-1.9.13p1" >> $LFSLOG_PROCESS

time { bash a.08.82E.Sudo-1.9.13p1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
