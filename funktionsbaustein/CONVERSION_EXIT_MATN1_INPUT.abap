*conversion_exit_matn1_input
* importing value(input)  type any
* exporting value(output)  type any
* exceptions  length_error

data: lv_matnr_input  type char3 value '216',
      lv_matnr_output type char18.

call function 'CONVERSION_EXIT_MATN1_INPUT'
  exporting
    input        = lv_matnr_input
  importing
    output       = lv_matnr_output
  exceptions
    length_error = 1
    others       = 2.
if sy-subrc eq 0.
  write :/ lv_matnr_output.
endif.
