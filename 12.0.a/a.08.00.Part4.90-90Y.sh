# a.08.00.Part5.90-90Y.sh
#
# Replacement for a.08.62.GRUB
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.90.GRUB.for.EFI.x64"
echo "08.90.GRUB.for.EFI.x64" >> $LFSLOG_PROCESS

bash a.08.90.GRUB.for.EFI.x64.sh ;

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.90A.Popt-1.19"
echo "08.90A.Popt-1.19" >> $LFSLOG_PROCESS

time { bash a.08.90A.Popt-1.19.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.90B.mandoc-1.14.6"
echo "08.90B.mandoc-1.14.6" >> $LFSLOG_PROCESS

time { bash a.08.90B.mandoc-1.14.6.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.90C.efivar-38"
echo "08.90C.efivar-38" >> $LFSLOG_PROCESS

time { bash a.08.90C.efivar-38.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.90D.efibootmgr-18"
echo "08.90D.efibootmgr-18" >> $LFSLOG_PROCESS

time { bash a.08.90D.efibootmgr-18.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.90Y.GRUB-2.06.for.EFI.x64"
echo "08.90Y.GRUB-2.06.for.EFI.x64" >> $LFSLOG_PROCESS

time { bash a.08.90Y.GRUB-2.06.for.EFI.x64.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
