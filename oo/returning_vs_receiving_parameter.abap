
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

