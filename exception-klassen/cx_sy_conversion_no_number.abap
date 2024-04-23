data: lv_result type i,
      lv_num    type i value 10,
      lv_text   type char4 value 'Text'.
data: gv_msg type ref to cx_root.


try.
    lv_result =  lv_text div lv_num.
  catch cx_sy_conversion_no_number into gv_msg.
    message gv_msg->get_text( ) type 'I'.
endtry.
