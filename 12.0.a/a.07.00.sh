# a.07.00.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "07.07.Gettext-0.22"
echo "07.07.Gettext-0.22" >> $LFSLOG_PROCESS

time { bash a.07.07.Gettext-0.22.sh ; }

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

echo "07.09.Perl-5.38.2"
echo "07.09.Perl-5.38.2" >> $LFSLOG_PROCESS

time { bash a.07.09.Perl-5.38.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "07.10.Python-3.11.5"
echo "07.10.Python-3.11.5" >> $LFSLOG_PROCESS

time { bash a.07.10.Python-3.11.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "07.11.Texinfo-7.0.3"
echo "07.11.Texinfo-7.0.3" >> $LFSLOG_PROCESS

time { bash a.07.11.Texinfo-7.0.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "07.12.Util-linux-2.39.1"
echo "07.12.Util-linux-2.39.1" >> $LFSLOG_PROCESS

time { bash a.07.12.Util-linux-2.39.1.sh ; }

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

#####

unset LFSLOG_PROCESS
