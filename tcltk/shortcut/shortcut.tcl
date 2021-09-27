#!/usr/bin/env wish
#
#	name        shortcut
#	version     1.1
#

# Package
	package require Tk

# Relative Path
  cd [file dirname [info script]]

# Source
  source ../tcltk_lib/source_lib.tcl
  source style/style.tcl
  
# WM
  c_WM create wm1 "shortcut" "res/icon.png" "600" "320" "#fff"
  wm1 no-resizable

# Body



# Vars

set name "Name"
set befehl "Exec"
set bild "Icon"
set terminal "Terminal"
set button "create shortcut"



# Frames

ttk::frame .p1
ttk::frame .p2
ttk::frame .p3
ttk::frame .p4
ttk::frame .p5
pack .p1 -side top -expand yes -fill both -padx 28
pack .p2 -side top -expand yes -fill both -padx 28
pack .p3 -side top -expand yes -fill both -padx 28
pack .p4 -side top -expand yes -fill both -padx 28
pack .p5 -side top -expand yes -fill both -padx 56



# Labels

ttk::label .p1.l_name -style h4.TLabel -text $name -width 10
ttk::label .p2.l_exec -style h4.TLabel -text $befehl -width 10
ttk::label .p3.l_icon -style h4.TLabel -text $bild -width 10
ttk::label .p4.l_terminal -style h4.TLabel -text $terminal -width 10

pack .p1.l_name -side left -expand no -fill x
pack .p2.l_exec -side left -expand no -fill x
pack .p3.l_icon -side left -expand no -fill x
pack .p4.l_terminal -side left -expand no -fill x



# Entrys

ttk::entry .p1.e_name -textvariable in_name
ttk::entry .p2.e_exec -textvariable in_exec
ttk::entry .p3.e_icon -textvariable in_icon
ttk::entry .p4.e_terminal -textvariable in_terminal

pack .p1.e_name -side right -expand yes -fill x
pack .p2.e_exec -side right -expand yes -fill x
pack .p3.e_icon -side right -expand yes -fill x
pack .p4.e_terminal -side right -expand yes -fill x



# Buttons

ttk::button .p5.b1 -style 01.TButton -text $button -command {
  set f [ open ~/Schreibtisch/$in_name.desktop w]
    puts $f "\[Desktop Entry\]"
    puts $f "Name=$in_name"
    puts $f "Exec=$in_exec"
    puts $f "Icon=$in_icon"
    puts $f "Terminal=$in_terminal"
    puts $f "Type=Application"
  close $f
}

pack .p5.b1 -side top -expand yes -fill x





# End of script


