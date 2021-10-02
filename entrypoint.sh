#!/bin/sh -e
echo " (                                      ";
echo " )\ )                )           (      ";
echo "(()/(             ( /(           )\     ";
echo " /(_))   (    (   )\()) (    (  ((_)(   ";
echo "(_))_    )\   )\ (_))/  )\   )\  _  )\  ";
echo " |   \  ((_) ((_)| |_  ((_) ((_)| |((_) ";
echo " | |) |/ _ \/ _| |  _|/ _ \/ _ \| |(_-< ";
echo " |___/ \___/\__|  \__|\___/\___/|_|/__/ ";
echo "                                        ";

# Update internal container common directory with content from workspace common directory if exists.
# This is used when updating common only. Regular users should not have common in workspace.
if [ -d "./common" ]
then
    echo "INFO     -  Using workspace common directory."
    rsync -a --delete ./common /common
fi

# Run the original command passed as arg to the container if any.
if [ $# -eq 0 ]; then
  echo "ERROR    -  No command provided."
  exit 1
else
  echo "INFO     -  Running command: '$@'"
  exec $@
fi
