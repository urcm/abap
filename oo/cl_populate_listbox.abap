report z_flight_delayed.

class delayed_flight definition.
  public section.

    types: begin of flight,
             carrid     type spfli-carrid,
             connid     type spfli-connid,
             cityfrom   type spfli-cityfrom,
             cityto     type spfli-cityto,
             airpfrom   type spfli-airpfrom,
             status     type char10,
             t_color    type lvc_t_scol,
           end of flight.

    types: ty_t_flight  type standard table of flight.

    data: t_flight      type standard table of flight,
          wa_flight     like t_flight,
          alv           type ref to cl_salv_table.

    data: columns       type ref to cl_salv_columns_table.
    data: column        type ref to cl_salv_column.

    methods: get_flight importing f_code type c.
    methods: populate_listbox exporting value_list type spfli-airpfrom.

  private section.
    methods: initialize_alv.
    methods: display.
    methods: set_column_width.
    methods: enable_layout_settings.
    methods: set_status_column.

    methods: set_color_colms changing ct_flight type ty_t_flight.

endclass.

class delayed_flight implementation.
  method get_flight.
    data: g_type type dd01v-datatype.

    call function 'NUMERIC_CHECK'
      exporting
        string_in = f_code
      importing
        htype     = g_type.

    if g_type = 'CHAR'.
      select * from spfli
        into table @data(spfli_tab).

      move-corresponding spfli_tab to t_flight keeping target lines.

      if sy-subrc = 0.
        loop at t_flight into data(ls_flight) where airpfrom = f_code.
          ls_flight-status = 'Delayed'.
          modify t_flight from ls_flight transporting status.
        endloop.
      endif.
    else.
      message 'Please enter a value of string.' type 'I' display like 'E'.
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
        set_color_colms( changing ct_flight = t_flight ).
      catch cx_salv_msg into data(message).
        message 'Salv list does not started.' type 'I' display like 'E'.
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

  method set_color_colms.
    data: lo_cols_tab type ref to cl_salv_columns_table,
          lo_col_tab  type ref to cl_salv_column_table.
    data: ls_color type lvc_s_colo.

    lo_cols_tab = alv->get_columns( ).

    include <color>.

    try.
        lo_col_tab ?= lo_cols_tab->get_column( 'STATUS' ).
        ls_color-col = col_total.
        lo_col_tab->set_color( ls_color ).
      catch cx_salv_not_found.
    endtry.


    data: lt_s_color type lvc_t_scol,
          ls_s_color type lvc_s_scol,
          la_flight  like line of ct_flight.

    loop at ct_flight into la_flight.
      if la_flight-status = 'Delayed'.
        ls_s_color-color-col = col_negative.
        ls_s_color-color-int = 0.
        ls_s_color-color-inv = 0.
        append ls_s_color to lt_s_color.
      endif.

      la_flight-t_color = lt_s_color.
      modify ct_flight from la_flight.
      clear  la_flight.
      clear  lt_s_color.
    endloop.

    try.
        lo_cols_tab->set_color_column( 'T_COLOR' ).
      catch cx_salv_data_error.
    endtry.

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
        message 'Error ' type 'I' display like 'E'.

    endtry.
  endmethod.

  method populate_listbox.

    data: list_name type vrm_id,
          list      type vrm_values,
          value_lis like line of list.

    clear list. refresh list.
    list_name = 'VALUE'.

    select distinct airpfrom from spfli
      into table @data(dt_spfli)
      where airpfrom is not null.

    sort dt_spfli ascending by airpfrom.

    loop at dt_spfli assigning field-symbol(<fs_spfli>).
      clear value_lis.
      value_lis-key = <fs_spfli>-airpfrom.
      value_lis-text = <fs_spfli>-airpfrom.
      append value_lis to list.
    endloop.

    call function 'VRM_SET_VALUES'
      exporting
        id     = list_name
        values = list.

  endmethod.

  method display.
    alv->display( ).
  endmethod.
endclass.


selection-screen begin of block p_fcode with frame title text-001.
parameters: value type spfli-airpfrom as listbox visible length 20.
selection-screen end of block p_fcode.

initialization.
  data(list_box) = new delayed_flight( ).

  call method list_box->populate_listbox importing value_list = value.

start-of-selection.
  data(dsp_flight) = new delayed_flight( ).

  call method dsp_flight->get_flight exporting f_code = value.
