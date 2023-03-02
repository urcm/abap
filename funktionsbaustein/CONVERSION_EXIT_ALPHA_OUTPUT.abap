*function module  conversion_exit_alpha_output
* importing value(input)  type clike
* exporting value(output)  type clike
*
*
*Documentation
*
*Conversion exit ALPHA, internal->external
*
*Longtext Documentation  Longtext Documentation
*
*Parameters
*
*
*importing  input   Any ABAP field
*exporting  output   External INPUT display, C field



data: lv_matnr_input  type char18 value '000000000000000216',
      lv_matnr_output type char18.

call function 'CONVERSION_EXIT_ALPHA_OUTPUT'
  exporting
    input  = lv_matnr_input
  importing
    output = lv_matnr_output.     " External INPUT display, C field

if sy-subrc eq 0.
  write :/ lv_matnr_output.
endif.
