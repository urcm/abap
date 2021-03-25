class zcl_singleton definition create private.
  public section.
    class-methods:
      get_instance
        returning
          value(result) type ref to zcl_singleton.
    methods:
      get_db_result
        returning
          value(re_attr) type char30,
      set_db_attr
        importing
          db_attr type char30.
  private section.
    class-data:
        sng_instance type ref to zcl_singleton.
    data:
        rs_attr type char30.
endclass.

class zcl_singleton implementation.
  method get_instance.
    if sng_instance is initial.
      create object sng_instance.
    endif.
    result = sng_instance.
  endmethod.
  method get_db_result.
    re_attr = rs_attr.
  endmethod.
  method set_db_attr.
    rs_attr = db_attr.

    select * from spfli into table @data(data_displayed)
      where airpfrom = @db_attr.

    cl_demo_output=>display( data_displayed ).
  endmethod.
endclass.

data: lcl_obj1 type ref to zcl_singleton,
      lcl_obj2 like lcl_obj1,
      lcl_obj3 like lcl_obj1,
      gv_attr  type char30.

start-of-selection.
  lcl_obj1 = zcl_singleton=>get_instance( ).
  lcl_obj1->set_db_attr( 'FRA' ).
  gv_attr =  lcl_obj1->get_db_result( ).
  write: gv_attr.
  clear gv_attr.
  skip 2.
  lcl_obj2 = zcl_singleton=>get_instance( ).
  gv_attr =  lcl_obj2->get_db_result( ).

  write: gv_attr.

  clear gv_attr.
  lcl_obj3 = zcl_singleton=>get_instance( ).
  lcl_obj3->set_db_attr( 'FCO' ).
  gv_attr = lcl_obj3->get_db_result( ).
  write: gv_attr.
