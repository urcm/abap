types: ty_spfli type standard table of spfli
                with non-unique key carrid connid.
data: gt_spfli type ty_spfli.

data: gt_fieldcat type lvc_t_fcat,
      gs_fieldcat type lvc_s_fcat.

class lcl_event_handler definition.
  public section.
    methods on_double_click for event double_click
            of cl_gui_alv_grid importing es_row_no e_column sender.
    methods on_toolbar for event toolbar
            of cl_gui_alv_grid importing e_object.
    methods hotpsot_click for event hotspot_click
            of cl_gui_alv_grid importing e_row_id e_column_id es_row_no.

  protected section.
  private section.

endclass.


class lcl_event_handler implementation.
  method on_double_click.
    message | Zeile { es_row_no-row_id } und Spalte { e_column-fieldname } | type 'I'.
  endmethod.

  method on_toolbar.

  endmethod.

  method hotpsot_click.
    " cl_demo_output=>display( gt_spfli[ e_row_id-index ] ).
    assign gt_spfli[ e_row_id-index ] to field-symbol(<fs_spfli>).
    assign component e_column_id-fieldname of structure <fs_spfli> to field-symbol(<fs_fieldname>).

    cl_demo_output=>write_data( |Fieldname: { <fs_fieldname> }| ).
    cl_demo_output=>write_data( <fs_spfli> ).
    cl_demo_output=>display( ).

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
        container_name              = 'CONTAINER_1'                 " Name of the dynpro CustCtrl name to link this container to
      exceptions
        cntl_error                  = 1                " CNTL_ERROR
        cntl_system_error           = 2                " CNTL_SYSTEM_ERROR
        create_error                = 3                " CREATE_ERROR
        lifetime_error              = 4                " LIFETIME_ERROR
        lifetime_dynpro_dynpro_link = 5                " LIFETIME_DYNPRO_DYNPRO_LINK
        others                      = 6.

  endif.

  create object go_alv
    exporting
      i_parent          = cl_gui_container=>screen0 "go_container                " Parent-Container
    exceptions
      error_cntl_create = 1                " Fehler beim Erzeugen des Controls
      error_cntl_init   = 2                " Fehler beim Initialisieren des Controls
      error_cntl_link   = 3                " Fehler beim Linken des Controls
      error_dp_create   = 4                " Fehler beim Erzeugen des DataProvider Control
      others            = 5.


  create object go_handler.
  set handler go_handler->on_double_click for go_alv.
  set handler go_handler->on_toolbar for go_alv.
  set handler go_handler->hotpsot_click for go_alv.

* Feldcatalog

  clear gs_fieldcat.
  gs_fieldcat-fieldname = 'CITYFROM'.
  gs_fieldcat-hotspot = 'X'.
 append gs_fieldcat to gt_fieldcat.


  call method go_alv->set_table_for_first_display
    exporting
      i_structure_name              = 
    changing
      it_fieldcatalog               = 
      it_outtab                     = .

