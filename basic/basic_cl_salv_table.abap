report zbasic_cl_salv_spfli.


data flight type standard table of spfli.
data alv type ref to cl_salv_table.

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
form get_flight .

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
    
    perform set_column_width.
        
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
