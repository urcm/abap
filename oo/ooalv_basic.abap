types: begin of g_tab,
         carrid type scarr-carrid,
         connid type sflight-connid,
       end of g_tab.

data: gt_tab type table of g_tab.

data: alv_container type ref to cl_gui_custom_container,
      alv_grid      type ref to cl_gui_alv_grid.

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
  
  endmodule.
