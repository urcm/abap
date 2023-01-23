data: gt_plant  like bapiqpmk_qpmk-plant_qpmk value '0001',
      gt_number like bapiqpmk_qpmk-mstr_char,
      gt_rc     like inri-returncode,
      gt_object like tnro-object value 'QMERKMALE'.

call function 'NUMBER_RANGE_ENQUEUE'
  exporting
    object           = gt_object
  exceptions
    foreign_lock     = 1
    object_not_found = 2
    system_failure   = 3
    others           = 4.

write :/ |gesperrtes Objekt : { gt_object }|. " Locked

call function 'NUMBER_GET_NEXT'
  exporting
    nr_range_nr = '01'
    object      = gt_object
    subobject   = gt_plant
    quantity    = '1'
  importing
    returncode  = gt_rc
    number      = gt_number.

write :/ |generierte Nummer: { gt_number }|.

call function 'NUMBER_RANGE_DEQUEUE'
  exporting
    object           = gt_object
  exceptions
    object_not_found = 1
    others           = 2.

write :/ |entsperrtes Objekt: { gt_object }|. " Unlocked
