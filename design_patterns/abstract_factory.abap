
class cls_abstract definition abstract.
  public section.
    methods:
      constructor importing !db_attr type char30,
      get_data,
      show_data abstract.
    
  protected section.
    data: data_displayed  type standard table of spfli.
    data: sb_attr type char30.
endclass.

class cls_abstract implementation.
  method constructor.
    sb_attr = db_attr.
  endmethod.

  method get_data.
    select * from spfli into table @data_displayed
      where airpfrom = @sb_attr.
  endmethod.
endclass.

class lcl_alv definition inheriting from cls_abstract final.
  public section.
    methods : show_data redefinition.
  protected section.
  private section.
    data : lo_alv type ref to cl_salv_table,
           lv_msg type ref to cx_salv_msg.
endclass.
