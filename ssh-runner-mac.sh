#!/bin/bash

nodes=$@
case $1 in
  "all" )
    nodes="en01 nn01 nn02 dn01 dn02 dn03 dn04 dn05"
    ;;
  "en" )
    nodes="en01"
    ;;
  "nn" )
    nodes="nn01 nn02"
    ;;
  "dn" )
    nodes="dn01 dn02 dn03 dn04 dn05"
    ;;
  "" )
#    help
    echo usage : 
    echo 'ssh [ all | en | nn | dn ]'
    exit 1
    ;;
esac


for n in $nodes; do
  osascript -e "
    tell application \"Terminal\" to activate
    tell application \"System Events\" to keystroke \"t\" using {command down} 
    delay 0.1
    tell app \"Terminal\"
      do script \"ssh $n\" in front window
    end tell
  "
done



# on new tab

#for n in $nodes; do
#  osascript -e "
#  tell app \"Terminal\"
#    do script \"ssh $n\"
#  end tell 
#  "
#done
##  ssh pi1
