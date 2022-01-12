
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
