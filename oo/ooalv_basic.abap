types: begin of g_tab,
         carrid type scarr-carrid,
         connid type sflight-connid,
       end of g_tab.

data: gt_tab type table of g_tab.

data: alv_container type ref to cl_gui_custom_container,
      alv_grid      type ref to cl_gui_alv_grid.

data: alv_container type ref to cl_gui_custom_container,
      alv_grid      type ref to cl_gui_alv_grid.
      
data: gt_fcat type lvc_t_fcat.

class lcl_eventhandler definition.
  public section.
    class-methods:
      handle_doubleclick for event double_click of cl_gui_alv_grid
        importing
            e_row
            e_column
            es_row_no
            sender.

endclass.

class lcl_eventhandler implementation.

  method handle_doubleclick.

    data: ls_gtab type g_tab,
          lv_mess type char200.

    read table gt_tab into ls_gtab index e_row-index.

*  data(ls_gtab) = gt_tab[ e_row ].

*    concatenate 'Clicked Row: '
*                e_column-fieldname
*                'Row Data: '
*                ls_gtab-carrid
*                ls_gtab-carrname
*                ls_gtab-connid
*                into lv_mess
*                separated by space.

    lv_mess = | 'Clicked Row: ' { e_column-fieldname } 'Carrid: ' { ls_gtab-carrid } 'Connid: ' {  ls_gtab-connid } 'Carrname: ' { ls_gtab-carrname } |.

*    message lv_mess type 'I'.

    call method alv_grid->set_current_cell_via_id
      exporting
*       is_row_id =     " Row
*       is_column_id =     " Column
        is_row_no = es_row_no.    " Numeric Row ID

    call method cl_gui_cfw=>set_new_ok_code
      exporting
        new_code = 'DETAIL'    " New OK_CODE
*  importing
*       rc       =     " Return code
      .


  endmethod.


start-of-selection.

  select
    sc~carrid
    sf~connid
    sc~carrname
    from scarr as sc
    inner join sflight as sf on sf~carrid eq sc~carrid
    into corresponding fields of table gt_tab.

  sort gt_tab ascending by carrid.

  call screen 0100.

*&---------------------------------------------------------------------*
*&      Module  STATUS_0100  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
module status_0100 output.
  set pf-status '0100'.
*  SET TITLEBAR 'xxx'.

  create object alv_container
    exporting
*     parent         =     " Parent container
      container_name = 'CONTAINER'    " Name of the Screen CustCtrl Name to Link Container To
*     style          =     " Windows Style Attributes Applied to this Container
*     lifetime       = LIFETIME_DEFAULT    " Lifetime
*     repid          =     " Screen to Which this Container is Linked
*     dynnr          =     " Report To Which this Container is Linked
*     no_autodef_progid_dynnr     =     " Don't Autodefined Progid and Dynnr?
    exceptions
*     cntl_error     = 1
*     cntl_system_error           = 2
*     create_error   = 3
*     lifetime_error = 4
*     lifetime_dynpro_dynpro_link = 5
      others         = 6.
  if sy-subrc <> 0.
* message id sy-msgid type sy-msgty number sy-msgno
*            with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  endif.

 create object alv_grid
    exporting
*     i_shellstyle      = 0    " Control Style
*     i_lifetime        =     " Lifetime
      i_parent = alv_container    " Parent Container
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
* message id sy-msgid type sy-msgty number sy-msgno
*            with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  endif.

  perform set_fcat.
  
  call method alv_grid->set_table_for_first_display
*  exporting
*    i_buffer_active               =     " Buffering Active
*    i_bypassing_buffer            =     " Switch Off Buffer
*    i_consistency_check           =     " Starting Consistency Check for Interface Error Recognition
*    i_structure_name              =     " Internal Output Table Structure Name
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
      it_outtab       = gt_tab   " Output Table
      it_fieldcatalog = gt_fcat    " Field Catalog
*     it_sort         =     " Sort Criteria
*     it_filter       =     " Filter Criteria
*  exceptions
*     invalid_parameter_combination = 1
*     program_error   = 2
*     too_many_lines  = 3
*     others          = 4
    .
  if sy-subrc <> 0.
* message id sy-msgid type sy-msgty number sy-msgno
*            with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  endif.
  
  endmodule.
  
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
module user_command_0100 input.
  data(gc_code) = sy-ucomm.

  case gc_code.
    when '&BACK'
      or '&CANCEL'
      or '&EXIT'.
      set screen 0.

    when 'DETAIL'.
      perform show_details.
  endcase.
  clear: gc_code.


endmodule.

*&---------------------------------------------------------------------*
*&      Form  SET_FCAT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form set_fcat .

  data: ls_fcat type lvc_s_fcat.

  refresh: gt_fcat.

  clear: ls_fcat.

  ls_fcat-reptext   = 'Airline Code'.
  ls_fcat-fieldname = 'CARRID'.
  ls_fcat-ref_table = 'G_TAB'.
  ls_fcat-outputlen = '18'.
  append ls_fcat to gt_fcat.

  clear: ls_fcat.
  ls_fcat-reptext   = 'Flight Connection Number'.
  ls_fcat-fieldname = 'CONNID'.
  ls_fcat-ref_table = 'G_TAB'.
  ls_fcat-outputlen = '25'.
  append ls_fcat to gt_fcat.

  clear: ls_fcat.
  ls_fcat-reptext   = 'Airline Name'.
  ls_fcat-fieldname = 'CARRNAME'.
  ls_fcat-ref_table = 'G_TAB'.
  ls_fcat-outputlen = '18'.
  append ls_fcat to gt_fcat.


endform.
