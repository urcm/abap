data: res_pn type p length 8 decimals 2.

class lcl_discount definition.
  public section.
    methods: calc_discount importing normal_price   type i
                                     discount_ratio type i
                           returning value(result)  like res_pn.
endclass.

class lcl_normalprice definition.
  public section.
    methods: calc_normalprice importing discounted_price type i
                                        discount_ratio   type i
                              returning value(result)    like res_pn.
endclass.

class lcl_discountrate definition.
  public section.
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

at selection-screen output.
   %_dis_prc_%_app_%-text = 'Discount Price'.
   %_nrm_prc_%_app_%-text = 'Normal Price'.
   %_di_rate_%_app_%-text = 'Discount Rate'.
   %_nm_prc_%_app_%-text = 'Normal Price'.
   %_ds_rt_%_app_%-text = 'Discounted Price'.

initialization.
  rad_gr = 'Select your option.'.
  frm_gr = 'Forms'.

start-of-selection.
  data(calc_dis) = new lcl_discount( ).
  data(chck_type) = new lcl_numcheck( ).
  data(info_detail) = new lcl_detail( ).
  data(calc_np) = new lcl_normalprice( ).
  data(calc_disrate) = new lcl_discountrate( ).

  case 'X'.
    when dis_prc.
      write :/ 'Discounted Price: '.
      write: / info_detail->add_text( calc_dis->calc_discount( normal_price = chck_type->check_num( gt_num = nm_prc ) discount_ratio = chck_type->check_num( gt_num = ds_rt ) ) ).
    when nrm_prc.
      write: / 'Normal Price: '.
      write: / info_detail->add_text( calc_np->calc_normalprice( discounted_price = chck_type->check_num( gt_num = nm_prc ) discount_ratio = chck_type->check_num( gt_num = ds_rt ) ) ).

    when di_rate.
      write: / 'Discount Rate: '.
      write: / info_detail->add_text( calc_disrate->calc_discountrate( normal_price = chck_type->check_num( gt_num = nm_prc ) discounted_price = chck_type->check_num( gt_num = ds_rt ) ) ).
  endcase.
