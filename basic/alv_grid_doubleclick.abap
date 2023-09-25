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
