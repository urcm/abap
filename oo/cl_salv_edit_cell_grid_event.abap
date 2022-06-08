
class lcl_salv_edit definition.
  public section.

    methods : constructor.
    
    data: gt_scarr type standard table of scarr.
    data: go_alv type ref to cl_salv_table.
    data: selections type ref to cl_salv_selections.
    data: fcat type lvc_t_fcat.

    methods: get_data.
    methods: create_salv.
    methods: salv_refresh for event after_refresh of cl_gui_alv_grid importing sender.

  private section.
    data:handler_check type abap_bool.
  
endclass.
