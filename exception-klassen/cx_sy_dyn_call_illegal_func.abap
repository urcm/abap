data: lv_string type string,
      lv_date   type d.

lv_string = 'Dies ist kein gültiges Datum.'.

try.
    call function 'CONVERT_DATE'
      exporting
        date_in          = lv_string
      importing
        date_out         = lv_date
      exceptions
        conversion_error = 1.

    write: / 'Date:', lv_date.
  catch cx_sy_dyn_call_illegal_func into data(lx_illegalfunc_error).
    " Behandlung der Ausnahme
    message lx_illegalfunc_error->get_text( ) type 'I'.
endtry.
