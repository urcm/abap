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
endclass.
