data: lv_answer             type c.

call function 'POPUP_TO_CONFIRM'
  exporting
    titlebar      = 'Confirmation'(904)
*   DIAGNOSE_OBJECT             = ' '
    text_question = 'Do you really want to delete this node and all its subnodes?'(903)
    text_button_1 = 'Ja'(001)
*   ICON_BUTTON_1 = ' '
    text_button_2 = 'Nein'(002)
*   ICON_BUTTON_2 = ' '
*   DEFAULT_BUTTON              = '1'
*   DISPLAY_CANCEL_BUTTON       = 'X'
*   USERDEFINED_F1_HELP         = ' '
*   START_COLUMN  = 25
*   START_ROW     = 6
*   POPUP_TYPE    =
*   IV_QUICKINFO_BUTTON_1       = ' '
*   IV_QUICKINFO_BUTTON_2       = ' '
  importing
    answer        = lv_answer "Rückgabewerte: '1', '2', 'A'  Return values: '1', '2', 'A'
* TABLES
*   PARAMETER     =
* EXCEPTIONS
*   TEXT_NOT_FOUND              = 1
*   OTHERS        = 2
  .
if sy-subrc <> 0.
* Implement suitable error handling here
endif.


if lv_answer eq '1'.
  message 'You clicked Yes' type 'S' display like 'I'.
elseif lv_answer eq '1'.
  message 'You clicked No' type 'S' display like 'I'.
else.
  message 'You clicked Cancel' type 'S' display like 'I'.
endif.
