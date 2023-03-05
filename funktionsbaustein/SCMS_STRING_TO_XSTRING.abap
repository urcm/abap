*scms_string_to_xstring
* importing text  type string
*  mimetype  type c default space
*  value(encoding)  type abap_encoding optional
* exporting buffer  type xstring
* exceptions  failed

data: lv_input  type string value 'www.google.de',
      lv_output type xstring.

call function 'SCMS_STRING_TO_XSTRING'
  exporting
    text   = lv_input
*   mimetype = SPACE
*   encoding =
  importing
    buffer = lv_output
  exceptions
    failed = 1
    others = 2.
if sy-subrc eq 0.
  write :/ lv_output.
endif.
