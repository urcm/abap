class lcl_discount definition.
  public section.
    methods: calc_discount importing normal_price   type i
                                     discount_ratio type i
                           returning value(result)  type i.
endclass.

class lcl_normalprice definition.
  public section.
    data: res_pn type p length 8 decimals 2.

    methods: calc_normalprice importing discounted_price type i
                                        discount_ratio   type i
                              returning value(result)    like res_pn.
endclass.

class lcl_discountrate definition.
  public section.
    data: res_pn type p length 8 decimals 2.
    methods: calc_discountrate importing normal_price     type i
                                         discounted_price type i
                               returning value(result)    like res_pn.
endclass.

class lcl_numcheck definition.
  public section.
    methods: check_num importing gt_num        type any
                       returning value(result) type i.

endclass.

class lcl_discount implementation.
  method calc_discount.
    result = normal_price - ( ( normal_price * discount_ratio ) / 100 ).
  endmethod.
endclass.


class lcl_normalprice implementation.
  method calc_normalprice.
    result = ( discounted_price * 100 ) / ( 100 -  discount_ratio ).
  endmethod.
endclass.

class lcl_discountrate implementation.
  method calc_discountrate.
    result = 100 - ( ( discounted_price / normal_price ) * 100 ).
  endmethod.
endclass.

class lcl_numcheck implementation.
  method check_num.
    data: rslt_type type dd01v-datatype.

    data: str type string.
    str = gt_num.

    call function 'NUMERIC_CHECK'
      exporting
        string_in = str
      importing
        htype     = rslt_type.

    if rslt_type = 'NUMC'.
      result = gt_num.
    else.
      message 'Please enter a value of string.' type 'I' display like 'E'.
    endif.

  endmethod.
endclass.

start-of-selection.
  data: calc_dis type ref to lcl_discount.
  data: chck_type type ref to lcl_numcheck.

  create object calc_dis.
  create object chck_type.

  cl_demo_output=>display( calc_dis->calc_discount( normal_price = chck_type->check_num( gt_num = 60 ) discount_ratio = chck_type->check_num( gt_num = 20 ) ) ).
