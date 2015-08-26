#!/bin/bash
SCRIPTPATH=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)
for file in `find ${SCRIPTPATH} -maxdepth 1`
do
  if [[ "$file" == *\/.* ]] || [[ "$file" == *ide* ]]
  then
    if [[ "$file" != *.git* ]]
    then
      targetfile="~/${file##*/}"
      sourcefile="${SCRIPTPATH}/${file}"
      rm -f $targetfile
      ln -s $sourcefile $targetfile
    fi
  fi
done
