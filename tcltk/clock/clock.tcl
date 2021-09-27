#!/usr/bin/env wish
#
#	name		  clock
#	version	  1.2
#

# Package
	package require Tk

# Relative Path
  cd [file dirname [info script]]

# Source
  source ../tcltk_lib/source_lib.tcl
  source style/style.tcl
  
# WM
  c_WM create wm1 "clock" "res/icon.png" "400" "320" "#fff"
  wm1 no-resizable

# Body


# Var

	set startpoint {}
	set stopped 1
	set break 0.00
	set farbe_bg white
	set farbe_fg black
	set systemTime [clock seconds]
	set zeit_anzeige [clock format $systemTime -format %H:%M:%S]
	set datum_anzeige [clock format $systemTime -format %d.%m.%Y]


# Label .uhr .zeit

	label .datum -text $datum_anzeige -pady 4m -foreground $farbe_fg -background $farbe_bg -font {-family times -size 16}
	label .zeit -text $zeit_anzeige -pady 10m -foreground $farbe_fg -background $farbe_bg -font {-family times -size 46}


# Button .start .counter .stop

	button .start -text Start -relief raised -padx 2m -pady 2m -font {-family verdana -size 10} -command {
		if {$stopped} {
			set stopped 0
			set startpoint [clock clicks -milliseconds]
			ticker
			.stop configure -state normal
			.start configure -state disabled
			.counter configure -state normal
		}
	}

	button .counter -text 0.00 -state normal -relief raised -padx 2m -pady 2m -font {-family times -size 16} -command {
		global break uprun_ticker
		if {!$stopped} {
			set stopped 1
			set break [expr {double($uprun_ticker)/1000+$break}]
			.start configure -state normal
			.stop configure -state normal
			.counter configure -state disabled
		}
	}

	button .stop -text Stop -state disabled -relief raised -padx 2m -pady 2m -font {-family verdana -size 10} -command {
		set stopped 1
		set break 0.00
		.start configure -state normal
		.stop configure -state disabled
		.counter configure -state disabled
	}


# Proc

	proc zeit_datum {} {
		after 1000 zeit_datum
		set systemTime [clock seconds]
		set zeit_anzeige [clock format $systemTime -format %H:%M:%S]
		set datum_anzeige [clock format $systemTime -format %d.%m.%Y]
		.zeit config -text $zeit_anzeige
		.datum config -text $datum_anzeige
	}
	zeit_datum

	proc ticker {} {
		global startpoint stopped break uprun_ticker
		if {$stopped} {return}
		after 50 ticker
		set uprun_ticker [expr {[clock clicks -milliseconds] - $startpoint}]
		.counter config -text [format "%.2f" [expr {double($uprun_ticker)/1000+$break}]]
	}


# Pack

	pack .datum -side top -fill x -pady 4m
	pack .zeit -side top -fill x -pady 4m
	pack .start .counter .stop -side left -expand 1 -fill x -padx 4m -pady 4m




# END SCRIPT





