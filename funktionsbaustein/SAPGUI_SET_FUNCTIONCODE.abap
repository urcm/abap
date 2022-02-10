
selection-screen begin of line.
selection-screen pushbutton 2(30) but_func user-command button_clicked.
selection-screen end of line.

at selection-screen.
  case sy-ucomm.
    when 'BUTTON_CLICKED'.
      perform call_f8_func.
  endcase.

initialization.

  but_func = |{ '@15@' }  Ruf F8|. " Execute <object> ICON_EXECUTE_OBJECT

start-of-selection.

  write: 'Der F8-Funktionscode wird aufgerufen.'.
*&---------------------------------------------------------------------*
*&      Form  CALL_F8_FUNC
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form call_f8_func .

  call function 'SAPGUI_SET_FUNCTIONCODE' 
    exporting
      functioncode           = 'ONLI'     "  function code of execute button(F8)
    exceptions
      function_not_supported = 1.

endform.
