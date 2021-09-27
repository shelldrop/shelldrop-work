#
#	c_shortcut.tcl
#
# c_Shortcut create sc1 "shortcut_absolut_path" "icon_absolut_path" "shortcut_name" "tclsh /home/absolut_path_of_script"
#


# Create class
oo::class create c_Shortcut {

# Contructor
  constructor { t_shortcut_path t_icon_path t_shortcut_name t_shortcut_command } {
    set shortcut_path $t_shortcut_path
    set icon_path $t_icon_path
    set shortcut_name $t_shortcut_name
    set shortcut_command $t_shortcut_command

    if { $shortcut_path ne "" && $shortcut_name ne "" } {
      set text "\[Desktop Entry\]
Name=$shortcut_name
Exec=$shortcut_command
Icon=$icon_path
Terminal=false
Type=Application
"
      set file [open $shortcut_path/$shortcut_name.desktop "w"]
      puts -nonewline $file $text
      close $file
      catch {exec chmod +x $shortcut_path/$shortcut_name.desktop }
    }
  }



#	End of class
}
#	End of script
