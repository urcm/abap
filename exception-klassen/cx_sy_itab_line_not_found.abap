data: lt_numbers type table of i,
      lv_index type i,
      lv_value type i.
data: gv_msg type ref to cx_root.

lt_numbers = value #( ( 1 ) ( 2 ) ( 3 ) ( 4 ) ).
lv_value = 5.

try.
    data(lv_value_new) = lt_numbers[ lv_value ].
  catch cx_sy_itab_line_not_found into gv_msg.
    message gv_msg->get_text( ) type 'I'.
endtry.
