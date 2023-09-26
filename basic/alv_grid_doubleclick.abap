types: ty_spfli type standard table of spfli
                with non-unique key carrid connid.
data: gt_spfli type ty_spfli.


class lcl_event_handler definition.
  public section.
    methods on_double_click for event double_click
            of cl_gui_alv_grid importing es_row_no e_column.

  protected section.
  private section.

endclass.

class lcl_event_handler implementation.
  method on_double_click.
    message | Zeile { es_row_no-row_id } und Spalte { e_column-fieldname } | type 'I'.
  endmethod.

endclass.


data: go_handler   type ref to lcl_event_handler,
      go_container type ref to cl_gui_custom_container,
      go_alv       type ref to cl_gui_alv_grid.

start-of-selection.

  select * from spfli into table gt_spfli.

  if go_container is not bound.
    create object go_container
      exporting
*       parent                      =                  " Parent container
        container_name              = 'CONTAINER_1'                 " Name of the dynpro CustCtrl name to link this container to
*       style                       =                  " Windows style attributes applied to this container
*       lifetime                    = lifetime_default " Lifetime
*       repid                       =                  " Dynpro to which this container is linked to
*       dynnr                       =                  " Report to which this container is linked to
*       no_autodef_progid_dynnr     =                  " dont autodefine progid and dynnr?
      exceptions
        cntl_error                  = 1                " CNTL_ERROR
        cntl_system_error           = 2                " CNTL_SYSTEM_ERROR
        create_error                = 3                " CREATE_ERROR
        lifetime_error              = 4                " LIFETIME_ERROR
        lifetime_dynpro_dynpro_link = 5                " LIFETIME_DYNPRO_DYNPRO_LINK
        others                      = 6.
    if sy-subrc <> 0.
* message id sy-msgid type sy-msgty number sy-msgno
*   with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    endif.
  endif.

create object go_alv
    exporting
*     i_shellstyle      = 0                " Control Style
*     i_lifetime        =                  " Lifetime
      i_parent          = cl_gui_container=>screen0 "go_container                " Parent-Container
*     i_appl_events     = space            " Ereignisse als Applikationsevents registrieren
*     i_parentdbg       =                  " Internal, donnot use.
*     i_applogparent    =                  " Container for application log
*     i_graphicsparent  =                  " Container for graphics
*     i_name            =                  " Name
*     i_fcat_complete   = space            " boolsche Variable (X=true, space=false)
    exceptions
      error_cntl_create = 1                " Fehler beim Erzeugen des Controls
      error_cntl_init   = 2                " Fehler beim Initialisieren des Controls
      error_cntl_link   = 3                " Fehler beim Linken des Controls
      error_dp_create   = 4                " Fehler beim Erzeugen des DataProvider Control
      others            = 5.
  if sy-subrc <> 0.
*   message id sy-msgid type sy-msgty number sy-msgno
*     with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  endif.

  create object go_handler.
  set handler go_handler->on_double_click for go_alv.


  call method go_alv->set_table_for_first_display
     exporting
* i_buffer_active = " Buffering active
* i_bypassing_buffer = " Turn off buffer
* i_consistency_check = " Start consistency check for interface error detection
       i_structure_name = 'SPFLI' " Structure name of the internal output table
* is_variant = " Display variant
* i_save = " Save display variant
* i_default = 'X' " Default display variant
* is_layout = " Layout
* is_print = " Print control
* it_special_groups = " Field groups
* it_toolbar_excluding = " excludes standard toolbar functions
* it_hyperlink = " Hyperlinks
* it_alv_graphics = " Table from structure DTC_S_TC
* it_except_qinfo = " Table for the exception tooltip
* ir_salv_adapter = " Interface ALV Adapter
     changing
       it_outtab = gt_spfli " Output table
* it_fieldcatalog = " Field catalog
* it_sort = " Sorting criteria
* it_filter = " Filter criteria
     exceptions
       invalid_parameter_combination = 1 " Parameter incorrect
       program_error = 2 " Program error
       too_many_lines = 3 " Too many lines in input-ready grid.
       others = 4.
   if sy-subrc <> 0.
* message id sy-msgid type sy-msgty number sy-msgno
* with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
   endif.
