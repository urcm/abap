
data: go_docking     type ref to cl_gui_docking_container,
      go_splitter    type ref to cl_gui_splitter_container,
      go_cell_top    type ref to cl_gui_container,
      go_cell_bottom type ref to cl_gui_container,
      go_grid1       type ref to cl_gui_alv_grid,
      go_grid2       type ref to cl_gui_alv_grid.

data: gs_layout type lvc_s_layo.

data: gt_scarr   type standard table of scarr,
      gt_sflight type standard table of sflight.


class lcl_eventhandler definition.
  public section.
    class-methods: handle_double_click for event double_click of cl_gui_alv_grid
      importing
          e_row
          e_column
          es_row_no
          sender.

endclass.

class lcl_eventhandler implementation.
  method handle_double_click.

    data: ls_scarr type scarr.

    check ( sender = go_grid1 ).

    read table gt_scarr into ls_scarr index e_row-index.

    check ( ls_scarr-carrid is not initial ).

    call method go_grid1->set_current_cell_via_id
      exporting
*       is_row_id =     " Row
*       is_column_id =     " Column
        is_row_no = es_row_no.    " Numeric Row ID

    call method cl_gui_cfw=>set_new_ok_code
      exporting
        new_code = 'DETAIL'    " New OK_CODE
*      importing
*       rc       =     " Return code
      .

  endmethod.

endclass.

start-of-selection.

  select * from scarr into table gt_scarr.

  create object go_docking
    exporting
      parent = cl_gui_container=>screen0   " Parent container
*     repid  =     " Report to Which This Docking Control is Linked
*     dynnr  =     " Screen to Which This Docking Control is Linked
*     side   = DOCK_AT_LEFT    " Side to Which Control is Docked
*     extension                   = 50    " Control Extension
*     style  =     " Windows Style Attributes Applied to This Docking Container
*     lifetime                    = LIFETIME_DEFAULT    " Lifetime
*     caption                     =     " Caption
*     metric = 0    " Metric
      ratio  = 90    " Percentage of Screen: Takes Priority Over EXTENSION
*     no_autodef_progid_dynnr     =     " Don't Autodefined Progid and Dynnr?
*     name   =     " Name
    exceptions
*     cntl_error                  = 1
*     cntl_system_error           = 2
*     create_error                = 3
*     lifetime_error              = 4
*     lifetime_dynpro_dynpro_link = 5
      others = 6.
  if sy-subrc <> 0.
*     message id sy-msgid type sy-msgty number sy-msgno
*                with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  endif.

  create object go_splitter
    exporting
*     link_dynnr        =     " Screen Number
*     link_repid        =     " Report Name
*     shellstyle        =     " Window Style
*     left              =     " Left-aligned
*     top               =     " top
*     width             =     " NPlWidth
*     height            =     " Hght
*     metric            = CNTL_METRIC_DYNPRO    " Metric
*     align             = 15    " Alignment
      parent            = go_docking    " Parent Container
      rows              = 2    " Number of Rows to be displayed
      columns           = 1   " Number of Columns to be Displayed
*     no_autodef_progid_dynnr =     " Don't Autodefined Progid and Dynnr?
*     name              =     " Name
    exceptions
      cntl_error        = 1
      cntl_system_error = 2
      others            = 3.
  if sy-subrc <> 0.
*     message id sy-msgid type sy-msgty number sy-msgno
*                with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  endif.
  
  
  call method go_splitter->get_container
    exporting
      row    = 1    " Row
      column = 1    " Column
    receiving
     container =  go_cell_top   " Container
    .
  call method go_splitter->get_container
    exporting
      row    = 2    " Row
      column = 1   " Column
    receiving
     container = go_cell_bottom    " Container
     
     
  create object go_grid1
    exporting
*     i_shellstyle      = 0    " Control Style
*     i_lifetime        =     " Lifetime
      i_parent = go_cell_top   " Parent Container
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


  set handler: lcl_eventhandler=>handle_double_click for go_grid1.

  create object go_grid2
    exporting
*     i_shellstyle      = 0    " Control Style
*     i_lifetime        =     " Lifetime
      i_parent = go_cell_bottom   " Parent Container
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
