#
#	source_lib.tcl
#
# source all files in tcltk_lib
#
#	  > source ../tcltk_lib/source_lib.tcl
#



# foreach listed folders in tcltk_lib

  foreach sourcefile [glob -dir ../tcltk_lib/class *.tcl] {
    source $sourcefile
  }
  
  foreach sourcefile [glob -dir ../tcltk_lib/style *.tcl] {
    source $sourcefile
  }
  


#	End of script
