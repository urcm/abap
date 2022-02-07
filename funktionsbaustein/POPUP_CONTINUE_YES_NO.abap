data : lv_output type c.

call function 'POPUP_CONTINUE_YES_NO'
  exporting
*   DEFAULTOPTION       = 'Y'
    textline1 = 'Möchten Sie das Programm verlassen?'
*   TEXTLINE2 = ' '
    titel     = 'Bestätigung'
*   START_COLUMN        = 25
*   START_ROW = 6
  importing
    answer    = lv_output.

if lv_output eq 'J'.
  message ' Sie können das Programm verlassen.' type 'I'.
else.
  message 'Sie können das Programm nicht verlassen' type 'I'.
endif.
