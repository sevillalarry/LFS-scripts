# a.8.00.Part5.80-80Y.sh
#
# Replacement for a.8.60.GRUB
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "8.80.GRUB-2.06.for.EFI.x64"
echo "8.80.GRUB-2.06.for.EFI.x64" >> $LFSLOG_PROCESS

time { bash a.8.80.GRUB-2.06.for.EFI.x64.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "8.80A.Popt-1.19"
echo "8.80A.Popt-1.19" >> $LFSLOG_PROCESS

time { bash a.8.80A.Popt-1.19.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "8.80B.mandoc-1.14.6"
echo "8.80B.mandoc-1.14.6" >> $LFSLOG_PROCESS

time { bash a.8.80B.mandoc-1.14.6.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "8.80C.efivar-38"
echo "8.80C.efivar-38" >> $LFSLOG_PROCESS

time { bash a.8.80C.efivar-38.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "8.80D.efibootmgr-18"
echo "8.80D.efibootmgr-18" >> $LFSLOG_PROCESS

time { bash a.8.80D.efibootmgr-18.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "8.80Y.GRUB-2.06.for.EFI.x64"
echo "8.80Y.GRUB-2.06.for.EFI.x64" >> $LFSLOG_PROCESS

time { bash a.8.80Y.GRUB-2.06.for.EFI.x64.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
