* scms_base64_encode_str
* importing value(input)  type xstring
* exporting value(output)  type string


data: lv_input  type xstring value '1DE965A000403D67A5',
      lv_output type string.

call function 'SCMS_BASE64_ENCODE_STR'
  exporting
    input  = lv_input
  importing
    output = lv_output.

if sy-subrc eq 0.
  write :/ lv_output.
endif.
