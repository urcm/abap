
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

