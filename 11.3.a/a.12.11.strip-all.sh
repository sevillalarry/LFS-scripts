#!/usr/bin/bash

if [ $EUID -ne 0 ]; then
  echo "Need to be root"
  exit 1
fi

{ find /usr/lib -type f -name '*.so*' ! -name '*dbg'
  find /usr/lib -type f -name '*.a'
  find /usr/{bin,sbin,libexec} -type f
} |  while read file; do
       if ! readelf -h $file >/dev/null 2>&1; then continue; fi
       if file $file | grep --quiet --invert-match 'not stripped'; then continue; fi

       cp --preserve $file    ${file}.tmp
       strip --strip-unneeded ${file}.tmp
       mv ${file}.tmp $file
     done
