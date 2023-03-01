# a.8.00.Part4.60-60Y.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

#####

echo "8.60.GRUB-2.06.for.EFI.x64"
echo "8.60.GRUB-2.06.for.EFI.x64" >> $LFSLOG_PROCESS

time { bash a.8.60.GRUB-2.06.for.EFI.x64.sh ; }

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "8.60A.Popt-1.18"
echo "8.60A.Popt-1.18" >> $LFSLOG_PROCESS

time { bash a.8.60A.Popt-1.18.sh ; }

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "8.60B.mandoc-1.14.6"
echo "8.60B.mandoc-1.14.6" >> $LFSLOG_PROCESS

time { bash a.8.60B.mandoc-1.14.6.sh ; }

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "8.60C.efivar-38.Part1"
echo "8.60C.efivar-38.Part1" >> $LFSLOG_PROCESS

time { bash a.8.60C.efivar-38.Part1.sh ; }

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "8.60C.efivar-38.Part2"
echo "8.60C.efivar-38.Part2" >> $LFSLOG_PROCESS

time { bash a.8.60C.efivar-38.Part2.sh ; }

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "8.60D.efibootmgr-18.Part1"
echo "8.60D.efibootmgr-18.Part1" >> $LFSLOG_PROCESS

time { bash a.8.60D.efibootmgr-18.Part1.sh ; }

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "8.60D.efibootmgr-18.Part2"
echo "8.60D.efibootmgr-18.Part2" >> $LFSLOG_PROCESS


time { bash a.8.60D.efibootmgr-18.Part2.sh ; }

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "8.60Y.GRUB-2.06.for.EFI.x64"
echo "8.60Y.GRUB-2.06.for.EFI.x64" >> $LFSLOG_PROCESS

time { bash a.8.60Y.GRUB-2.06.for.EFI.x64.sh ; }

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_TIME
