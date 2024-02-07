#!/bin/bash
#########################################################
# For a set of userids, set the min password age to 0   #
# Created by Roger Nem - 2018                           #
#########################################################

accounts="ansible
  root
  oracle
  others"

case $OSTYPE in
  linux*)
    cmd="/usr/bin/chage -m 0"
    ;;
  solaris*)
    cmd="/usr/bin/passwd -n 0 -x 90"
    ;;
  aix*)
    cmd="/usr/bin/chuser minage=0"
    ;;
  *) echo "Unkown os $OSTYPE"
     exit 1
    ;;
esac

for account in ${accounts}
do
  /usr/bin/id ${account} > /dev/null 2>&1 && ${cmd} ${account} && echo "${account} updated"
done
exit 0