#
#	c_ftp.tcl
#
# package require ftp
#
# c_FTP create ftp1 "host" "ftpdir" "ftpuser" "ftppass"
#   ftp1 upload "localfile"
#   ftp1 download "remotefile" "localpath(data/)"
#   ftp1 remove-local "localfile"
#


# Create class
oo::class create c_FTP {

# Vars
  variable host
  variable ftpdir
  variable ftpuser
  variable ftppass


# Contructor
  constructor { t_host t_ftpdir t_ftpuser t_ftppass } {
    set host $t_host
    set ftpdir $t_ftpdir
    set ftpuser $t_ftpuser
    set ftppass $t_ftppass
  }


# Method upload
  method upload { localfile } {
		set datum [clock format [clock seconds] -format %d%m%y]
    set handle [::ftp::Open $host $ftpuser $ftppass]
		::ftp::Cd $handle $ftpdir
		::ftp::Put $handle $localfile
		::ftp::Close $handle
	}


# Method download
  method download { remotefile localpath } {
  	set datum [clock format [clock seconds] -format %d%m%y]
    set handle [::ftp::Open $host $ftpuser $ftppass]
  	::ftp::Cd $handle $ftpdir
  	::ftp::Get $handle $remotefile
  	::ftp::Close $handle
    file rename -force $remotefile $localpath$remotefile
  }


# Method remove-local
  method remove-local { t_localfile } {
    set localfile $t_localfile
		file delete $localfile
	}


# Export
    export upload
    export upload
    export remove-local


#	End of class
}
#	End of script
