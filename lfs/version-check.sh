#!/usr/bin/env bash
#
# Simple script to list version numbers of critical development tools
#
# Copied from 
#    http://www.linuxfromscratch.org/lfs/view/development/prologue/hostreqs.html
# 

export LC_ALL=C

bash --version | head -n1 | cut -d" " -f2-4
echo "/bin/sh -> `readlink -f /bin/sh`"
echo Perl `perl -V:version`
echo -n "Coreutils: "; chown --version | head -n1 | cut -d")" -f2

tar --version | head -n1
bzip2 --version 2>&1 < /dev/null | head -n1 | cut -d" " -f1,6-
gzip --version | head -n1
xz --version | head -n1
echo "Texinfo: `makeinfo --version | head -n1`"

find --version | head -n1
grep --version | head -n1
sed --version | head -n1
gawk --version | head -n1
if [ -e /usr/bin/awk ];
  then echo "/usr/bin/awk -> `readlink -f /usr/bin/awk`";
  else echo "awk not found"; fi

bison --version | head -n1
if [ -e /usr/bin/yacc ];
  then echo "/usr/bin/yacc -> `readlink -f /usr/bin/yacc`";
  else echo "yacc not found"; fi

m4 --version | head -n1
make --version | head -n1
patch --version | head -n1
diff --version | head -n1
echo -n "Binutils: "; ld --version | head -n1 | cut -d" " -f3-
ldd --version | head -n1 | cut -d" " -f2-  # glibc version
gcc --version | head -n1
g++ --version | head -n1
echo 'main(){}' > dummy.c && g++ -o dummy dummy.c
if [ -x dummy ]
  then echo "g++ compilation OK";
  else echo "g++ compilation failed"; fi
rm -f dummy.c dummy

cat /proc/version

