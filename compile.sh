#!/bin/sh

# полный путь до скрипта
export ABSOLUTE_FILENAME=`readlink -e "$0"`
# каталог, в котором лежит скрипт
export DIRECTORY=`dirname "$ABSOLUTE_FILENAME"`

cd $DIRECTORY

export app=ceb
export binapp=bin/Linux/$app
export tmpapp=tmp_$app.bas

rm -f $binapp
iconv -f CP866 -t UTF-8 $app.bas -o $tmpapp && fbc $tmpapp -x $binapp && rm $tmpapp && chmod 500 $binapp

