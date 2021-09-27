#!/usr/bin/env bash

# # # bash sd-sync.sh
#
#
#     The program synchronizes the entire folder in which this file is located
#     with the Remote-Host
#
#
#     Config Remote_Host
#
#        Remote-Host need openssh-server
#
         remote_host=user@192.168.XXX.XXX:/home/user/
#
# # #



# Init
function init() {
   clear
   folder=`echo $PWD | rev | cut -d'/' -f1 | rev`
   
   if [ -d "$PWD" ]
   then
      cd $PWD
      navi
   else
      echo -e "\n\t local path not found"
      exit;
   fi
}


# Navi
function navi() {
   echo -e "\n\n\n\t shelldrop-sync\n\n"
   echo -e "\t local folder\t $PWD\n"
   echo -e "\t remote folder\t $remote_host$folder\n\n"
   echo -e -n "\t\t [d] [download] \n\t\t [u] [upload] \n\t\t [e] [exit] \n\n\t\t"
   read input
   echo -e "\n\n"
   
   case "$input" in
      u | upload) upload ;;
      d | download) download ;;
      e | exit) exit ;;
      *)
         clear
         echo -e "\n\n\t command unknow!"
         read dummy
         init ;;
   esac
}


# Upload
function upload() {
   rsync -urz --delete -e ssh . $remote_host$folder
   clear
   echo -e "\n\n\t upload successful\n\n"
   read dummy
   init
}


# Download
function download() {
   rsync -urz --delete -e ssh $remote_host$folder ../.
   clear
   echo -e "\n\n\t download successful\n\n"
   read dummy
   init
}


# loop
   init
   
   
   
# # # End

#

#








