#
# s_style_global.tcl
#
#
# ttk::label .l1 -style h1.TLabel -text ""
# ttk::button .b1 -style b1.TButton -text ""
#


# Theme
  ttk::style theme use default



# Frame

  # standard
    ttk::style configure TFrame \
      -background #fff \
      
         

# Button standard + b1-b2

  # standard
    ttk::style map TButton -background [list active #0ff]
    ttk::style configure TButton \
      -background #9ff \
      -borderwidth 0 \
      
  # b1
    ttk::style map b1.TButton -background [list active #ee5]
    ttk::style configure b1.TButton \
      -background #9ff \
      -borderwidth 0 \
      
  # b2
    ttk::style map b2.TButton -background [list active #0ff]
    ttk::style configure b2.TButton \
      -background #9ff \
      -borderwidth 0 \
      
  # b3
    ttk::style map b3.TButton -background [list active #0ff]
    ttk::style configure b3.TButton \
      -background #9ff \
      -borderwidth 0 \
       
  # b4
    ttk::style map b4.TButton -background [list active #0ff]
    ttk::style configure b4.TButton \
      -background #9ff \
      -borderwidth 0 \
      
      


# Label standard + h1-h6

  # standard
    font create tlabel_standard -family Arial -size 13
    ttk::style configure TLabel \
      -font tlabel_standard \
      -background #fff \
      -foreground #000 \
         
  # h1
    font create h1 -family Arial -size 32
    ttk::style configure h1.TLabel \
      -font h1 \
      -background #fff \
      -foreground #000 \

  # h2
    font create h2 -family Arial -size 24
    ttk::style configure h2.TLabel \
      -font h2 \
      -background #fff \
      -foreground #000 \
          
  # h3
    font create h3 -family Arial -size 18
    ttk::style configure h3.TLabel \
      -font h3 \
      -background #fff \
      -foreground #000 \
           
  # h4
    font create h4 -family Arial -size 16
    ttk::style configure h4.TLabel \
      -font h4 \
      -background #fff \
      -foreground #000 \
           
  # h5
    font create h5 -family Arial -size 13
    ttk::style configure h5.TLabel \
      -font h5 \
      -background #fff \
      -foreground #000 \
      
  # h6
    font create h6 -family Arial -size 10
    ttk::style configure h6.TLabel \
      -font h6 \
      -background #fff \
      -foreground #000 \
       


  

# End of style




