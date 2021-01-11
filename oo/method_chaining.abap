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

class lcl_detail definition.
  public section.
    data: res_txt type string.
    data: res_pn type p length 8 decimals 2.
    methods: add_text importing final_result  like res_pn
                      returning value(result) like res_txt.
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

class lcl_detail implementation.
  method add_text.
    data: str_cv type string.
    data: sentence type string value 'The result is : '.
    str_cv = final_result.
    write: / str_cv.
    concatenate sentence str_cv into result.
  endmethod.
endclass.

selection-screen: begin of block blck1 with frame title rad_gr.
parameters: dis_prc radiobutton group rg1,
            nrm_prc radiobutton group rg1,
            di_rate radiobutton group rg1.
selection-screen: end of block blck1.

selection-screen: begin of block p_form with frame title frm_gr.
parameters: nm_prc type i,
            ds_rt  type i.
selection-screen: end of block p_form.

initialization.

  rad_gr = 'Select your option.'.


start-of-selection.

  data: calc_dis type ref to lcl_discount.
  data: chck_type type ref to lcl_numcheck.
  data: info_detail type ref to lcl_detail.

  data(calc_np) = new lcl_normalprice( ).

  create object calc_dis.
  create object chck_type.
  create object info_detail.

  case 'X'.
    when dis_prc.
      write :/ 'Discounted Price: '.
      write: / info_detail->add_text( calc_dis->calc_discount( normal_price = chck_type->check_num( gt_num = nm_prc ) discount_ratio = chck_type->check_num( gt_num = ds_rt ) ) ).
    when nrm_prc.
      write: / 'Normal Price: '.
      write: / info_detail->add_text( calc_np->calc_normalprice( discounted_price = chck_type->check_num( gt_num = nm_prc ) discount_ratio = chck_type->check_num( gt_num = ds_rt ) ) ).

    when di_rate.
      write: / 'Discount Rate:'.
  endcase.
