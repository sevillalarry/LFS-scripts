# a.08.00.Part5.81-81Z.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.81.WGet"
echo "08.81.WGet" >> $LFSLOG_PROCESS

bash a.08.81.WGet.sh ;

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.81A.libtasn1-4.19.0"
echo "08.81A.libtasn1-4.19.0" >> $LFSLOG_PROCESS

time { bash a.08.81A.libtasn1-4.19.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.81B.p11-kit-0.24.1"
echo "08.81B.p11-kit-0.24.1" >> $LFSLOG_PROCESS

time { bash a.08.81B.p11-kit-0.24.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.81C.make-ca-1.12"
echo "08.81C.make-ca-1.12" >> $LFSLOG_PROCESS

time { bash a.08.81C.make-ca-1.12.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.81Z.WGet-1.21.3"
echo "08.81Z.WGet-1.21.3" >> $LFSLOG_PROCESS

time { bash a.08.81Z.WGet-1.21.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
