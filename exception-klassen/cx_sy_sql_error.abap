data: lv_data type string.
data: lv_table type dd02l-tabname value 'SCAR'.

try.
    select single carrid
           into lv_data
           from (lv_table)
           where carrid = 'XYZ'.

    write: / 'Daten erfolgreich abgerufen:', lv_data.

  catch cx_sy_sql_error into data(lx_sql_error).
    write: / 'Es ist ein SQL-Fehler aufgetreten:', lx_sql_error->get_text( ).
endtry.
