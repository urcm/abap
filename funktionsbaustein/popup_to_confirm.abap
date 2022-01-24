
data: lv_answer type c,
      lv_count  type i.

data: gt_scarr     type standard table of scarr,
      lt_parameter type standard table of spar.

select * from scarr into table gt_scarr.


lv_count = lines( gt_scarr ).

message conv string( lv_count ) type 'I'.

lt_parameter = value #( ( param = 'LV_COUNTER'
                            value = lv_count ) ).

call function 'POPUP_TO_CONFIRM'
  exporting
    titlebar       = 'Confirmation'
*   DIAGNOSE_OBJECT             = ' '
    text_question  = 'Sollen &LV_COUNTER& Datensätze wirklich gelöscht werden?'(001)
    text_button_1  = 'Ja'
*   ICON_BUTTON_1  = ' '
    text_button_2  = 'Nein'
*   ICON_BUTTON_2  = ' '
*   DEFAULT_BUTTON = '1'
*   DISPLAY_CANCEL_BUTTON       = 'X'
*   USERDEFINED_F1_HELP         = ' '
*   START_COLUMN   = 25
*   START_ROW      = 6
*   POPUP_TYPE     =
*   IV_QUICKINFO_BUTTON_1       = ' '
*   IV_QUICKINFO_BUTTON_2       = ' '
  importing
    answer         = lv_answer "Rückgabewerte: '1', '2', 'A'  Return values: '1', '2', 'A'
  tables
    parameter      = lt_parameter
  exceptions
    text_not_found = 1
    others         = 2.
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
