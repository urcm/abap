
class lcl_salv_edit definition.
  public section.

    methods : constructor.
    
    data: gt_scarr type standard table of scarr.
    data: go_alv type ref to cl_salv_table.
    data: selections type ref to cl_salv_selections.
    data: fcat type lvc_t_fcat.

    methods: get_data.
    methods: create_salv.
  
  private section.
  
endclass.
