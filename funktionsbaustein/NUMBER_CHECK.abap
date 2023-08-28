*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     VALUE(NR_RANGE_NR) LIKE  INRI-NRRANGENR
*"     VALUE(NUMBER)
*"     VALUE(OBJECT) LIKE  INRI-OBJECT
*"     VALUE(SUBOBJECT) DEFAULT SPACE
*"     VALUE(TOYEAR) LIKE  INRI-TOYEAR DEFAULT '0000'
*"     VALUE(NUMERIC_CHECK) DEFAULT SPACE
*"     VALUE(LENGTH_CHECK) TYPE  ABAP_BOOL OPTIONAL
*"  EXPORTING
*"     VALUE(RETURNCODE) LIKE  INRI-RETURNCODE
*"  EXCEPTIONS
*"      INTERVAL_NOT_FOUND
*"      NUMBER_RANGE_NOT_EXTERN
*"      OBJECT_NOT_FOUND


data: lv_object like inri-object value 'BANF'.
data: lv_nummer type c length 10 value '0099999990'.
data: lv_returncode like  inri-returncode.


call function 'NUMBER_CHECK'
  exporting
    nr_range_nr             = '02'
    number                  = lv_nummer
    object                  = lv_object
*   SUBOBJECT               = ' '
*   TOYEAR                  = '0000'
*   NUMERIC_CHECK           = ' '
*   LENGTH_CHECK            =
  importing
    returncode              = lv_returncode
  exceptions
    interval_not_found      = 1
    number_range_not_extern = 2
    object_not_found        = 3.

cl_demo_output=>display( lv_returncode ).

case lv_returncode.
  when space. " Nummer innerhalb des angegebenen Intervalls
    write: 20.
  when 'X'. " Nummer außerhalb des angegebenen Intervalls
    write: 10.
  when others.
endcase.
