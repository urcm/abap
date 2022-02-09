data : lv_output type c.

call function 'POPUP_TO_CONFIRM_DATA_LOSS'
  exporting
    defaultoption = 'J'
    titel         = 'Bestätigung'
  importing
    answer        = lv_output.
if lv_output = 'J'.
   message ' Sie können das Programm verlassen.' type 'I'.
endif.
