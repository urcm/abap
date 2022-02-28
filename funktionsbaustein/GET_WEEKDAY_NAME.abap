
data: lv_ltxt type t246-langt,
      lv_stxt type t246-kurzt.

call function 'GET_WEEKDAY_NAME'
  exporting
    date        = sy-datum
    language    = sy-langu " 'D'
  importing
    longtext    = lv_ltxt
    shorttext   = lv_stxt
  exceptions
    calendar_id = 1
    date_error  = 2
    not_found   = 3
    wrong_input = 4
    others      = 5.

if sy-subrc eq 0.
  write: / lv_ltxt .
  write: / lv_stxt .
endif.
