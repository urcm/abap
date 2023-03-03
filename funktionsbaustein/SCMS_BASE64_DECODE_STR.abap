*scms_base64_decode_str
* importing input  type string
*  value(unescape)  type string default 'X'
* exporting output  type xstring
* exceptions  failed

data: lv_input  type string value 'Hello ABAP Welt!',
      lv_output type xstring.

call function 'SCMS_BASE64_DECODE_STR'
  exporting
    input  = lv_input
*   unescape = 'X'
  importing
    output = lv_output
  exceptions
    failed = 1
    others = 2.

if sy-subrc eq 0.
  write :/ lv_output.
endif.
