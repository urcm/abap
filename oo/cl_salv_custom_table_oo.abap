class cl_salv_table_custom definition.
  public section.
    methods constructor.
    methods display.

  private section.
    data alv              type ref to cl_salv_table.
    data data_displayed   type standard table of spfli.
    data column           type ref to cl_salv_column.

    methods get_data_displayed.
    methods initialize_alv.
    methods set_column_width.
    methods set_report_name.
    methods set_toolbar_functuality.
    methods set_row_strip.
    methods hide_column.
    methods change_column_name.
endclass.

class cl_salv_table_custom implementation.
  method constructor.
    get_data_displayed( ).
    initialize_alv( ).
    set_report_name( ).
    set_toolbar_functuality( ).
    set_row_strip( ).
    hide_column( ).
    change_column_name( ).
  endmethod.

  method get_data_displayed.
    select * from spfli into table data_displayed up to 100 rows.
  endmethod.

  method set_column_width.
    alv->get_columns( )->set_optimize( ).
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

  method set_report_name.
    alv->get_display_settings( )->set_list_header( |Flight Schedule - { lines( data_displayed ) } records | ).
  endmethod.

  method set_toolbar_functuality.
    alv->get_functions( )->set_all( ).
  endmethod.

  method set_row_strip.
    alv->get_display_settings( )->set_striped_pattern( if_salv_c_bool_sap=>true ).
  endmethod.

  method hide_column.
    alv->get_columns( )->get_column( 'MANDT' )->set_visible( if_salv_c_bool_sap=>false ).
  endmethod.

  method change_column_name.
    column = alv->get_columns( )->get_column( 'CARRID' ).
    column->set_short_text( 'CNum' ).
    column->set_medium_text( 'Carrier Num').
    column->set_long_text( 'Carrier Number' ).
  endmethod.

  method display.
    alv->display( ).
  endmethod.
endclass.

start-of-selection.
  data(custom_alv) = new cl_salv_table_custom( ).
  custom_alv->display( ).
