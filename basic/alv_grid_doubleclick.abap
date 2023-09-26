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



