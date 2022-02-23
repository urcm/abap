data: gt_scarr type table of scarr.

data: itext type table of tline-tdline,
      xtext like line of itext.

data: go_docking     type ref to cl_gui_docking_container,
      go_splitter    type ref to cl_gui_splitter_container,
      go_cell_top    type ref to cl_gui_container,
      go_cell_bottom type ref to cl_gui_container,
      go_alv         type ref to cl_gui_alv_grid,
      go_text_editor type ref to cl_gui_textedit.

data: go_counter type i value 0.

class lcl_handler definition.
  public section.
    class-methods:
      handle_double_click for event double_click of cl_gui_alv_grid
        importing
            e_row
            e_column
            es_row_no
            sender.

endclass.

class lcl_handler implementation.
  method handle_double_click.
    data: ls_scarr type scarr.

    check ( sender = go_alv ).

    read table gt_scarr into ls_scarr index e_row-index.

    check ( ls_scarr-carrid is not initial ).

    call method go_alv->set_current_cell_via_id
      exporting
*       is_row_id =     " Row
*       is_column_id =     " Column
        is_row_no = es_row_no.    " Numeric Row ID

    call method cl_gui_cfw=>set_new_ok_code
      exporting
        new_code = '&ADDTEXT'     " New OK_CODE
*    importing
*       rc       =     " Return code
      .
  endmethod.
endclass.


start-of-selection.

  select * from scarr into table gt_scarr.

  if go_docking is initial.

    create object go_docking
      exporting
*       parent =     " Parent container
        repid  = sy-cprog    " Report to Which This Docking Control is Linked
        dynnr  = sy-dynnr    " Screen to Which This Docking Control is Linked
        side   = cl_gui_docking_container=>dock_at_top    " Side to Which Control is Docked
*       extension                   = 50    " Control Extension
*       style  =     " Windows Style Attributes Applied to This Docking Container
*       lifetime                    = LIFETIME_DEFAULT    " Lifetime
*       caption                     =     " Caption
**      metric                      =     " Metric
        ratio  = 90    " Percentage of Screen: Takes Priority Over EXTENSION
*       no_autodef_progid_dynnr     =     " Don't Autodefined Progid and Dynnr?
        name   = 'DOC_CONT'    " Name
      exceptions
*       cntl_error                  = 1
*       cntl_system_error           = 2
*       create_error                = 3
*       lifetime_error              = 4
*       lifetime_dynpro_dynpro_link = 5
        others = 6.
    if sy-subrc <> 0.
*   message id sy-msgid type sy-msgty number sy-msgno
*              with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    endif.
