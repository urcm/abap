data: lt_line type tline_t.
data(lv_matnr) = |{ '11' width = 18 alpha = in }|.

try.

    call function 'READ_TEXT'
      exporting
        client                  = sy-mandt
        id                      = 'BEST'
        language                = sy-langu
        name                    = conv thead-tdname( lv_matnr )
        object                  = 'MATERIAL'
      tables
        lines                   = lt_line
      exceptions
        id                      = 1
        language                = 2
        name                    = 3
        not_found               = 4
        object                  = 5
        reference_check         = 6
        wrong_access_to_archive = 7
        others                  = 8.

    cl_demo_output=>display( lt_line ).

  catch cx_sy_no_handler into data(no_handler_error).
    write: / 'Error:', no_handler_error->get_text( ).
endtry.
