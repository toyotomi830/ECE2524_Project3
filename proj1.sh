#!/bin/bash
#this script print file and diractory in list to a html file
function getFile(){
  dir=$1
  out=$2
  fileAndDirs=$(ls $dir)
  for element in $fileAndDirs
  do
    files=$1"/"$element
    if [ -r $files ]
    then
    if [ -d $files ]
     then
      echo "<li>${element}<ul>" >> $out
      #echo "<li>${element}<ul>"
      getFile $files $out
      echo "</li></ul>" >> $out
    else
      echo "<li>${element}</li>" >> $out
    #  echo "<li>\"${element}\"</li>"
    fi
  fi
  done
}

if [ $# -ne 2 ]
then
  echo "Wrong argument, please check your command. no output generate."
else
path=$1
out=$2
echo "<!DOCTYPE html><html><head></head><body><h1>List of file and directory in ${path}</h1><ul>" >> $out
getFile $path $out
echo "</ul>" >>$out
fi
