
data: go_grid    type ref to cl_gui_alv_grid,
      gs_layout  type lvc_s_layo,
      go_docking type ref to cl_gui_docking_container.
      
data: gt_scarr type standard table of scarr.

if go_grid is initial.
  create object go_grid
    exporting
*     i_shellstyle      = 0    " Control Style
*     i_lifetime        =     " Lifetime
      i_parent = cl_gui_container=>default_screen "go_docking.   " Parent Container
*     i_appl_events     = SPACE    " Register Events as Application Events
*     i_parentdbg       =     " Internal, Do not Use
*     i_applogparent    =     " Container for Application Log
*     i_graphicsparent  =     " Container for Graphics
*     i_name   =     " Name
*     i_fcat_complete   = SPACE    " Boolean Variable (X=True, Space=False)
    exceptions
*     error_cntl_create = 1
*     error_cntl_init   = 2
*     error_cntl_link   = 3
*     error_dp_create   = 4
      others   = 5.
  if sy-subrc <> 0.
*   message id sy-msgid type sy-msgty number sy-msgno
*              with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  endif.

  gs_layout-edit = abap_true.

  select * from scarr into table gt_scarr up to 100 rows.
  
  call method go_grid->set_table_for_first_display
    exporting
**     i_buffer_active               =     " Buffering Active
**     i_bypassing_buffer            =     " Switch Off Buffer
**     i_consistency_check           =     " Starting Consistency Check for Interface Error Recognition
      i_structure_name = 'SCARR'   " Internal Output Table Structure Name
**     is_variant                    =     " Layout
**     i_save                        =     " Save Layout
**     i_default                     = 'X'    " Default Display Variant
      is_layout        = gs_layout   " Layout
**     is_print                      =     " Print Control
**     it_special_groups             =     " Field Groups
**     it_toolbar_excluding          =     " Excluded Toolbar Standard Functions
**     it_hyperlink                  =     " Hyperlinks
**     it_alv_graphics               =     " Table of Structure DTC_S_TC
**     it_except_qinfo               =     " Table for Exception Quickinfo
**     ir_salv_adapter               =     " Interface ALV Adapter
    changing
      it_outtab        = gt_scarr    " Output Table
**     it_fieldcatalog               =     " Field Catalog
**     it_sort                       =     " Sort Criteria
**     it_filter                     =     " Filter Criteria
    exceptions
**      invalid_parameter_combination = 1
**      program_error                 = 2
**      too_many_lines                = 3
      others           = 4.
  if sy-subrc <> 0.
*     message id sy-msgid type sy-msgty number sy-msgno
*                with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  endif.

  call method go_grid->set_ready_for_input
    exporting
      i_ready_for_input = 1.

  write: space.

endif.




***********************************
* cl_gui_container=>screen0
***********************************


data: go_grid type ref to cl_gui_alv_grid.
data: gt_table type table of scarr.

select * from scarr into table gt_table.
  
  
create object go_grid
  exporting
*    i_shellstyle      = 0    " Control Style
*    i_lifetime        =     " Lifetime
    i_parent          = cl_gui_container=>screen0    " Parent Container
*    i_appl_events     = SPACE    " Register Events as Application Events
*    i_parentdbg       =     " Internal, Do not Use
*    i_applogparent    =     " Container for Application Log
*    i_graphicsparent  =     " Container for Graphics
*    i_name            =     " Name
*    i_fcat_complete   = SPACE    " Boolean Variable (X=True, Space=False)
  exceptions
*    error_cntl_create = 1
*    error_cntl_init   = 2
*    error_cntl_link   = 3
*    error_dp_create   = 4
    others            = 5
  .
if sy-subrc <> 0.
* message id sy-msgid type sy-msgty number sy-msgno
*            with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
endif.

call method go_grid->set_table_for_first_display
  exporting
*    i_buffer_active               =     " Buffering Active
*    i_bypassing_buffer            =     " Switch Off Buffer
*    i_consistency_check           =     " Starting Consistency Check for Interface Error Recognition
    i_structure_name              =  'SCARR'   " Internal Output Table Structure Name
*    is_variant                    =     " Layout
*    i_save                        =     " Save Layout
*    i_default                     = 'X'    " Default Display Variant
*    is_layout                     =     " Layout
*    is_print                      =     " Print Control
*    it_special_groups             =     " Field Groups
*    it_toolbar_excluding          =     " Excluded Toolbar Standard Functions
*    it_hyperlink                  =     " Hyperlinks
*    it_alv_graphics               =     " Table of Structure DTC_S_TC
*    it_except_qinfo               =     " Table for Exception Quickinfo
*    ir_salv_adapter               =     " Interface ALV Adapter
  changing
    it_outtab                     =  gt_table   " Output Table
*    it_fieldcatalog               =     " Field Catalog
*    it_sort                       =     " Sort Criteria
*    it_filter                     =     " Filter Criteria
*  exceptions
*    invalid_parameter_combination = 1
*    program_error                 = 2
*    too_many_lines                = 3
*    others                        = 4
  .
if sy-subrc <> 0.
* message id sy-msgid type sy-msgty number sy-msgno
*            with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
endif.


call method go_grid->set_ready_for_input
    exporting
      i_ready_for_input = 1.


write: space.


