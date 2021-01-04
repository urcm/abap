class delayed_flight definition.
  public section.
    types: begin of flight,
             carrid   type spfli-carrid,
             connid   type spfli-connid,
             cityfrom type spfli-cityfrom,
             cityto   type spfli-cityto,
             airpfrom type spfli-airpfrom,
             status   type char10,
           end of flight.

    data: t_flight    type standard table of flight,
          wa_flight   like t_flight,
          alv         type ref to cl_salv_table.

    data: columns     type ref to cl_salv_columns_table.
    data: column      type ref to cl_salv_column.

    methods: get_flight importing f_code type string.

  private section.
    methods: initialize_alv,
      display,
      set_column_width,
      enable_layout_settings,
      set_status_column.
endclass.

class delayed_flight implementation.
  method get_flight.
    select * from spfli
      into table @data(spfli_tab).

    move-corresponding spfli_tab to t_flight keeping target lines.

    if sy-subrc = 0.
      loop at t_flight into data(ls_flight) where airpfrom = f_code.
        ls_flight-status = 'Delayed'.
        modify t_flight from ls_flight transporting status.
      endloop.
    endif.

    initialize_alv( ).
    display( ).
  endmethod.

  method initialize_alv.
    try.
        cl_salv_table=>factory(
        importing
          r_salv_table = alv
          changing
            t_table = t_flight
            ).

        columns = alv->get_columns( ).
        enable_layout_settings( ).
        set_status_column( ).
      catch cx_salv_msg into data(message).
        "get errror handling.
    endtry.
  endmethod.

  method enable_layout_settings.
    data layout_settings type ref to cl_salv_layout.
    data layout_key      type salv_s_layout_key.

    layout_settings = alv->get_layout( ).
    layout_key-report = sy-repid.
    layout_settings->set_key( layout_key ).
    layout_settings->set_save_restriction( if_salv_c_layout=>restrict_none ).
  endmethod.

  method set_column_width.
    alv->get_columns( )->set_optimize( ).
  endmethod.

  method set_status_column.
    data not_found type ref to cx_salv_not_found.
    try.
        column = columns->get_column( 'STATUS' ).
        column->set_long_text( 'Status' ).
        column->set_medium_text( 'Flight Status' ).
        column->set_short_text( 'Status' ).
        column->set_output_length( 10 ).
      catch cx_salv_not_found into not_found.
    endtry.
  endmethod.

  method display.
    alv->display( ).
  endmethod.
endclass.

start-of-selection.
  data(dsp_flight) = new delayed_flight( ).

  call method dsp_flight->get_flight
    exporting
      f_code = 'FRA'.
