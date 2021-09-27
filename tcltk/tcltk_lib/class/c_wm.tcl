#
#	c_wm.tcl
#
# package require Tk
#
# c_WM create wm1 "title" "iconpath" "width" "height" "bg"
#   wm1 no-deco
#   wm1 no-resizable
#


# Create class
oo::class create c_WM {

# Contructor
  constructor { t_title t_iconpath t_width t_height t_bg } {
    set title $t_title
    set iconpath $t_iconpath
    set width $t_width
    set height $t_height
    set bg $t_bg

		wm title  . $title;
		. configure -bg $bg;
    image create photo applicationIcon -file $iconpath
    wm iconphoto . -default applicationIcon
    set x [expr {([winfo screenwidth .] - $width) / 2}];
    set y [expr {([winfo screenheight .] - $height) / 2}];
    wm geometry . ${width}x${height}+${x}+${y};
  }

# Method no-deco
  method no-deco {} {
    wm overrideredirect . yes
  }

# Method no-resizable
  method no-resizable {} {
	   wm resizable . 0 0
  }

# Export
  export no-deco
  export no-resizable



#	End of class
}
#	End of script
