*----------------------------------------------------------------------*
*       CLASS math_square DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
class math_square definition.
  public section.

    data: lv_num1   type i,
          lv_num2   type i,
          lv_result type i.

    methods: math_square_diff.
    methods: math_square_sum.
    methods: math_square_aplusb.
    methods: math_square_aminb.

  private section.

endclass.                    "math_square  DEFINITION

*----------------------------------------------------------------------*
*       CLASS math_square  IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
class math_square implementation.

  method math_square_diff .
    lv_result = ( lv_num1 - lv_num2 ) * ( lv_num1 + lv_num2 ).
  endmethod.

  method math_square_sum .
    lv_result = ( ( lv_num1 + lv_num2 ) * ( lv_num1 + lv_num2 ) ) - ( 2 * lv_num1 * lv_num2 ).
  endmethod.

  method math_square_aplusb.
    lv_result = ( lv_num1 * lv_num1 ) + ( 2 * lv_num1 * lv_num2 ) + ( lv_num2 * lv_num2 ).
  endmethod.

  method math_square_aminb.
    lv_result = ( lv_num1 * lv_num1 ) - ( 2 * lv_num1 * lv_num2 ) + ( lv_num2 * lv_num2 ).
  endmethod.


endclass.

data: go_math_square type ref to math_square.

start-of-selection.

  create object: go_math_square.
  
  " Square a^2 - b^2
  go_math_square->lv_num1 = 4.
  go_math_square->lv_num2 = 2.

  go_math_square->math_square_diff( ).

  write :/ go_math_square->lv_result.
  
  
  " Square a^2 + b^2
  go_math_square->lv_num1 = 4.
  go_math_square->lv_num2 = 2.

  go_math_square->math_square_sum( ).

  write :/ go_math_square->lv_result.

  " Square (a + b)^2
  go_math_square->lv_num1 = 4.
  go_math_square->lv_num2 = 2.

  go_math_square->math_square_aplusb( ).

  write :/ go_math_square->lv_result.

  " Square (a - b)^2
  go_math_square->lv_num1 = 4.
  go_math_square->lv_num2 = 2.

  go_math_square->math_square_aminb( ).

  write :/ go_math_square->lv_result.
