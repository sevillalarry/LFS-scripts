# a.07.00.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "07.07.Gettext-0.21.1"
echo "07.07.Gettext-0.21.1" >> $LFSLOG_PROCESS

time { bash a.07.07.Gettext-0.21.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "07.08.Bison-3.8.2"
echo "07.08.Bison-3.8.2" >> $LFSLOG_PROCESS

time { bash a.07.08.Bison-3.8.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "07.09.Perl-5.36.0"
echo "07.09.Perl-5.36.0" >> $LFSLOG_PROCESS

time { bash a.07.09.Perl-5.36.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "07.10.Python-3.11.4"
echo "07.10.Python-3.11.4" >> $LFSLOG_PROCESS

time { bash a.07.10.Python-3.11.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "07.11.Texinfo-7.0.2"
echo "07.11.Texinfo-7.0.2" >> $LFSLOG_PROCESS

time { bash a.07.11.Texinfo-7.0.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "07.12.Util-linux-2.38.1"
echo "07.12.Util-linux-2.38.1" >> $LFSLOG_PROCESS

time { bash a.07.12.Util-linux-2.38.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "07.13.Cleaning.up.Only"
echo "07.13.Cleaning.up.Only" >> $LFSLOG_PROCESS

time { bash a.07.13.Cleaning.up.Only.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "07.13.pause.Backup"
echo "07.13.pause.Backup" >> $LFSLOG_PROCESS

bash a.07.13.pause.Backup.sh

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
