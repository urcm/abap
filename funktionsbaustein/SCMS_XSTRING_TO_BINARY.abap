*scms_xstring_to_binary
* importing buffer  type xstring
*  value(append_to_table)  type c default space
* exporting value(output_length)  type i
* tables binary_tab  type standard table of any with header line

data: lv_input  type xstring value '7777772E676F6F676C652E6465',
      lv_output type standard table of raw255.

call function 'SCMS_XSTRING_TO_BINARY'
  exporting
    buffer     = lv_input
*   append_to_table = SPACE
*  importing
*   output_length   =
  tables
    binary_tab = lv_output.

if sy-subrc eq 0.
  loop at lv_output assigning field-symbol(<fs_output>).
    write :/ <fs_output>.
  endloop.
endif.
