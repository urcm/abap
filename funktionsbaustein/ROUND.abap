*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"       IMPORTING
*"              DECIMALS DEFAULT 0
*"              INPUT
*"              SIGN DEFAULT SPACE
*"       EXPORTING
*"              OUTPUT
*"       EXCEPTIONS
*"              INPUT_INVALID
*"              OVERFLOW
*"              TYPE_INVALID
*"----------------------------------------------------------------------


data: lv_value type p decimals 6 value '245.784512'.
data: lv_decimals type i value 4.
data: lv_result type p decimals 3.


call FUNCTION 'ROUND'
  exporting
    decimals      = lv_decimals    " Number decimal places, to which rounding is to be carried ou
    input         = lv_value    " value to be rounded
*    sign          = SPACE    " Flag for rounding up, rounding down, commercial roundoff
  importing
    output        =  lv_result   " rounded value
*  exceptions
*    input_invalid = 1
*    overflow      = 2
*    type_invalid  = 3
*    others        = 4
  .

cl_demo_output=>display( lv_result ).
