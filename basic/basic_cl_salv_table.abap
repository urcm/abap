data flight type standard table of spfli.
data alv type ref to cl_salv_table.
data column type ref to cl_salv_column.

start-of-selection.
  perform get_flight.
  perform initialize_alv.
  perform display.
*&---------------------------------------------------------------------*
*&      Form  GET_FLIGHT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form get_flight.
  select * from spfli into table flight where airpfrom = 'FRA'.
endform.
*&---------------------------------------------------------------------*
*&      Form  INITIALIZE_ALV
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form initialize_alv .
  data message type ref to cx_salv_msg.

  try.
      cl_salv_table=>factory(
      importing
        r_salv_table = alv
      changing
        t_table      = flight
        ).

      perform alv_settings.

    catch cx_salv_msg into message.
      " get error handling
  endtry.
endform.

*&---------------------------------------------------------------------*
*&      Form  SET_COLUMN_WIDTH
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form set_column_width .
  data col_opt type ref to cl_salv_columns_table.

  col_opt = alv->get_columns( ).
  col_opt->set_optimize( ).
endform.

*&---------------------------------------------------------------------*
*&      Form  ALV_SETTINGS
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form alv_settings .
  perform set_column_width.
  perform set_report_name.
  perform set_toolbar_functionality.
  perform set_row_strip.
  perform hide_column.
  perform change_column_name.
endform.

*&---------------------------------------------------------------------*
*&      Form  SET_REPORT_NAME
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form set_report_name.
  alv->get_display_settings( )->set_list_header( |Flight Schedule - { lines( flight ) } records | ).
endform.

*&---------------------------------------------------------------------*
*&      Form  SET_TOOLBAR_FUNCTIONALITY
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form set_toolbar_functionality .
  alv->get_functions( )->set_all( ).
endform.

*&---------------------------------------------------------------------*
*&      Form  SET_ROW_STRIP
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form set_row_strip .
  alv->get_display_settings( )->set_striped_pattern( if_salv_c_bool_sap=>true ).
endform.

*&---------------------------------------------------------------------*
*&      Form  HIDE_COLUMN
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form hide_column .
  alv->get_columns( )->get_column( 'MANDT' )->set_visible( if_salv_c_bool_sap=>false ).
endform.

*&---------------------------------------------------------------------*
*&      Form  CHANGE_COLUMN_NAME
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form change_column_name .
  column = alv->get_columns( )->get_column( 'CARRID' ).
  column->set_short_text( 'CNum' ).
  column->set_medium_text( 'Carrier Num' ).
  column->set_long_text( 'Carrier Number' ).
endform.

*&---------------------------------------------------------------------*
*&      Form  DISPLAY
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form display.
  alv->display( ).
endform.
