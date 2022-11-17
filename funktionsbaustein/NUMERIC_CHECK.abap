data: lv_str(10) type c value 'Change',
      lv_type    type dd01v-datatype.

call function 'NUMERIC_CHECK'
  exporting
    string_in = lv_str
  importing
*   STRING_OUT       =
    htype     = lv_type.


write :/ lv_str && ' is a ' && lv_type.
