REPORT cl_salv_table_oo.

class cl_salv_table_custom definition.
  public section.
    methods constructor.
    methods display.

  private section.
    data alv              type ref to cl_salv_table.
    data data_displayed   type standard table of spfli.

    methods get_data_displayed.
    methods initialize_alv.

endclass.

class cl_salv_table_custom implementation.
  method constructor.
    get_data_displayed( ).
    initialize_alv( ).
  endmethod.

  method get_data_displayed.
    select * from spfli into table data_displayed up to 100 rows.
  endmethod.

  method initialize_alv.
    try.
        cl_salv_table=>factory(
        importing
          r_salv_table = alv
          changing
            t_table   = data_displayed
            ).
      catch cx_salv_msg into data(message).
        " get error handling
    endtry.
  endmethod.

  method display.
    alv->display( ).
  endmethod.
endclass.

start-of-selection.
  data(custom_alv) = new cl_salv_table_custom( ).
  custom_alv->display( ).