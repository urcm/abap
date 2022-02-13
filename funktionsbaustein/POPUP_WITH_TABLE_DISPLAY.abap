data: gt_scarr type standard table of scarr.
data : lv_output like  sy-tabix.

select * from scarr into table gt_scarr.

call function 'POPUP_WITH_TABLE_DISPLAY'
  exporting
    endpos_col   = 80
    endpos_row   = 25
    startpos_col = 1
    startpos_row = 1
    titletext    = 'Table'
  importing
    choise       = lv_output
  tables
    valuetab     = gt_scarr
  exceptions
    break_off    = 1
    others       = 2.

write :/ gt_scarr[ lv_output ] .
