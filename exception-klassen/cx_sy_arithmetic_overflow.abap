data: lv_result type i,
      lv_num1   TYPE i VALUE 68354175,
      lv_num2   TYPE i VALUE 99.
data: gv_msg type ref to cx_root.


try.
    lv_result =  lv_num1 * lv_num2.
  catch cx_sy_arithmetic_overflow into gv_msg.
    message gv_msg->get_text( ) type 'I'.
endtry.
