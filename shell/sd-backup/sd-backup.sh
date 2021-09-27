#!/usr/bin/env bash

# # # bash sd-backup.sh
#
#
#        The program backup the entire folder in which this file is located
#        to the FTP Server
#
#
#     Config FTP Server
#
         ftp_host="ftp://myhost.com/folder"
         user_name="MyUserName"
         backup_name="BackupName"
#
# # #



# CD to relative path of script
   parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
   cd "$parent_path"

# Terminal Config
   PS1=""
   clear


# Navi
function navi() {
   clear
   echo -e "\n\n\n\t sd-backup\n\n"
   echo -e "\t Das Verzeichnis $parent_path wird auf $ftp_host gespeichert\n\n"

   datum=`date +%d-%m-%Y`
   file_name=$backup_name-$datum

   stty -echo
   read -p "            Password $ftp_host  > " pw; echo
   stty echo
   zip -r $file_name.zip $parent_path/* > /dev/null 2>&1
   echo -e "\n\n"
   
   ccrypt $file_name.zip
   if [ $? = 0 ]
   then
      clear
   else
      clear
	   echo -e "\n\n\t\t\t File crypt failed\n\n\n"
	   read dummy
	   exit
   fi
   
   curl -T $file_name.zip.cpt --user $user_name:$pw $ftp_host/$file_name.zip.cpt > /dev/null 2>&1
   if [ $? = 0 ]
   then
      clear
	   echo -e "\n\n\t\t\t Backup successful\n\n\n"
   else
      clear
	   echo -e "\n\n\t\t\t Backup failed\n\n\n"
   fi

   rm -r ./$file_name.zip.cpt
   read dummy
   exit
}


# Init
  navi


   
# # # End

#

#





