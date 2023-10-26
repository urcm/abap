*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"       IMPORTING
*"             VALUE(I_DATE_EXT)
*"       EXPORTING
*"             VALUE(E_DATE_INT) TYPE  D
*"       EXCEPTIONS
*"              ERROR
*"----------------------------------------------------------------------


data gv_e_date_int type d.


call function 'DATE_CONV_EXT_TO_INT'
  exporting
    i_date_ext = |{ sy-datum date = environment }|
  importing
    e_date_int = gv_e_date_int
  exceptions
    error      = 1.


write:/ gv_e_date_int.
