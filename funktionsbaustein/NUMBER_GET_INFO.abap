*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     VALUE(NR_RANGE_NR) LIKE  INRI-NRRANGENR OPTIONAL
*"     VALUE(OBJECT) LIKE  INRI-OBJECT
*"     VALUE(SUBOBJECT) DEFAULT SPACE
*"     VALUE(TOYEAR) LIKE  INRI-TOYEAR DEFAULT '0000'
*"  EXPORTING
*"     VALUE(INTERVAL) LIKE  NRIV STRUCTURE  NRIV
*"     REFERENCE(NRIV) TYPE  NRIV_TT
*"  EXCEPTIONS
*"      INTERVAL_NOT_FOUND
*"      OBJECT_NOT_FOUND

data: lv_nr_range_nr like  inri-nrrangenr value '01',
      lv_object      like inri-object value 'BANF',
      ls_interval    like  nriv.


call function 'NUMBER_GET_INFO'
  exporting
    nr_range_nr        = lv_nr_range_nr
    object             = lv_object
*   SUBOBJECT          = ' '
*   TOYEAR             = '0000'
  importing
    interval           = ls_interval
*   NRIV               =
  exceptions
    interval_not_found = 1
    object_not_found   = 2.

case sy-subrc.
  when 0.
    cl_demo_output=>display( ls_interval ).
endcase.
