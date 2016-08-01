#/usr/bin/env bash
# bash wrapper for pyconfconv.
# source this script with the right arguments.
# $1 = filename
# $2 = section
# Owain Kenway
# Where this is distributed it is done so under the MIT license.

fullpath=`readlink -f $0`
pyconfmydir=`dirname ${fullpath}`
nargs=$#
if [ $nargs == 2 ]; then
eval `${pyconfmydir}/pyconfconv.py -l bash -i $1 -s $2`
elif [ $nargs == 1 ]; then
eval `${pyconfmydir}/pyconfconv.py -l bash -i $1`
else
  echo "Wrong number of arguments."
fi
