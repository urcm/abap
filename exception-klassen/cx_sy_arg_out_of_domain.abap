data: lv_result type i,
      lv_num    type i value -1.

data: gv_msg type ref to cx_root.

try.

    lv_result = sqrt( lv_num ).
    cl_demo_output=>write_data( lv_result ).
    cl_demo_output=>display(  ).
  catch cx_sy_arg_out_of_domain into gv_msg.
    message gv_msg->get_text( ) type 'I'.

endtry.
