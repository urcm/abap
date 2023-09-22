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
