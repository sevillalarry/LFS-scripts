# a.07.13.Cleaning.up.Only.sh
#
# Note: this is Clean Up only
#
# you should perform the "BackUp" procedure manually
#

rm -rf /usr/share/{info,man,doc}/*

find /usr/{lib,libexec} -name \*.la -delete

rm -rf /tools
