
class lcl_demo definition.
  public section.
    methods: make_addition importing iv_num1          type i
                                     iv_num2          type i
                           returning value(rv_result) type i.

endclass.

class lcl_demo implementation.

  method make_addition.
    rv_result = iv_num1 + iv_num2.
  endmethod.

endclass.

data lv_result type i.

start-of-selection.

  data(go_add) = new lcl_demo( ).

  lv_result = go_add->make_addition(             " Returning Parameter
          iv_num1 = 4
          iv_num2 = 5
        ).
  write :/ lv_result.

  go_add->make_addition(                         " Receiving Parameter
    exporting
      iv_num1   = 4
      iv_num2   = 5
    receiving
      rv_result = lv_result
  ).
  write :/ lv_result.
