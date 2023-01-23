data: gt_plant  like bapiqpmk_qpmk-plant_qpmk,
      gt_number like bapiqpmk_qpmk-mstr_char,
      gt_rc     like inri-returncode.

call function 'NUMBER_GET_NEXT'
  exporting
    nr_range_nr = '01'
    object      = 'QMERKMALE'
    subobject   = '0001'
    quantity    = '1'
  importing
    returncode  = gt_rc
    number      = gt_number.

write :/ gt_number.
