# a.08.00.Part1.03-05.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.03.Man-pages-6.03"
echo "08.03.Man-pages-6.03" >> $LFSLOG_PROCESS

time { bash a.08.03.Man-pages-6.03.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.04.Iana-Etc-20230202"
echo "08.04.Iana-Etc-20230202" >> $LFSLOG_PROCESS

time { bash a.08.04.Iana-Etc-20230202.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.05.Glibc-2.37.Part1"
echo "08.05.Glibc-2.37.Part1" >> $LFSLOG_PROCESS

time { bash a.08.05.Glibc-2.37.Part1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.05.Glibc-2.37.Part9"
echo "08.05.Glibc-2.37.Part9" >> $LFSLOG_PROCESS

bash a.08.05.Glibc-2.37.Part9.sh

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
