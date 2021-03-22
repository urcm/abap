
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
