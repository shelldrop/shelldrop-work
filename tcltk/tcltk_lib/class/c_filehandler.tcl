#
#	c_filehandler.tcl
#
# sudo apt install wget
#
#	c_Filehandler create fh1
#   fh1 getfile_wget "url" "filename"
#   fh1 readfile "filename"
#     -> set x / puts [h1 readfile "filename"]
#   fh1 writefile_over "filename" "text"
#   fh1 writefile_lappend "filename" "text"
#


# Create class
oo::class create c_Filehandler {

  variable L_readrow

# Contructor
  constructor { } {
  }


# Method getfile_wget
  method getfile_wget { url filename } {
    catch {exec wget -O $filename $url}
  }


# Method readfile
  method readfile { filename } {
    set fp [open $filename r]
    while { [gets $fp data] >= 0 } {
      lappend L_readrow $data
    }
    close $fp
    return $L_readrow
  }


# Method writefile_over
  method writefile_over { filename text } {
    set fp [open $filename w+]
    puts $fp $text
    close $fp
  }


# Method writefile_lappend
  method writefile_lappend { filename text } {
    set fp [open $filename a+]
    puts $fp $text
    close $fp
  }


# Export
  export getfile_wget
  export readfile
  export writefile_over
  export writefile_lappend


#	End of class
}
#	End of script



