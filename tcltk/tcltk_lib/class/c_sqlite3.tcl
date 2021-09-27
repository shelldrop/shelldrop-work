#
#	c_sqlite3.tcl
#
# sudo apt install sqlite3
#
#	package require sqlite3
#
#	c_Sqlite3 create sql1 "db_path(data/)" "db_name(testdb)"
#   sql1 create_table "tablename" "id INTEGER PRIMARY KEY AUTOINCREMENT, vorname text, name text"
#   sql1 insert "tablename" "arg1" "arg2" "args3" "etc" --> Need Integer Primary Key Autoincrement at first column
#   sql1 update "tablename" "set_column" "set_value" "where_column" "where_value"
#   sql1 delete "tablename" "where_column" "where_value"
#   sql1 select_table "tablename"
#   sql1 select_row "tablename" "s_row" "s_text"
#   sql1 select_column "tablename" "o_column "s_column" "s_text"
#       ->  Use Select as List
#       ->  set x [sql1 select_table "tablename"] OR
#       ->  puts [sql1 select_table "tablename"] OR
#


# Create class
oo::class create c_Sqlite3 {

# Vars
  variable db_path
  variable db_name

# Contructor
  constructor { t_db_path t_db_name} {
    set db_path $t_db_path
    set db_name $t_db_name
    sqlite3 $db_name $db_path$db_name.db
  }

# Method create_table
  method create_table { tablename tabledesign } {
    $db_name eval "CREATE TABLE if not exists $tablename ($tabledesign)"
  }

# Method insert
  method insert { tablename args } {
    foreach arg $args {
      lappend List ",'$arg'"
    }
  $db_name eval "INSERT INTO $tablename VALUES(NULL $Liste)"
  }

# Method update
  method update { tablename i_column i_text s_column s_text} {
    $db_name eval "UPDATE $tablename SET '$i_column'='$i_text' WHERE $s_column='$s_text'"
  }

# Method delete
  method delete { tablename s_column s_text} {
    $db_name eval "DELETE FROM $tablename WHERE $s_column='$s_text'"
  }

# Method select_table
  method select_table { tabelname } {
    set select_table [$db_name eval "SELECT * FROM $tabelname"]
    set L_select_table $select_table
  }

# Method select_row
  method select_row { tabelname s_row s_text } {
    set select_row [$db_name eval "SELECT * FROM $tabelname WHERE $s_row='$s_text'"]
    set L_select_row $select_row
  }

# Method select_column
  method select_column { tabelname o_column s_column s_text } {
    set select_column [$db_name eval "SELECT $o_column FROM $tabelname WHERE $s_column='$s_text'"]
    set L_select_column $select_column
  }

# Export
  export create_table
  export insert
  export update
  export select_table
  export select_row
  export select_column


#	End of class
}
#	End of script
