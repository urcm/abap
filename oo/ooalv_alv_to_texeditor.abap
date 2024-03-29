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
        
    create object go_splitter
      exporting
*       link_dynnr              =     " Screen Number
*       link_repid              =     " Report Name
*       shellstyle              =     " Window Style
*       left    =     " Left-aligned
*       top     =     " top
*       width   =     " NPlWidth
*       height  =     " Hght
*       metric  = CNTL_METRIC_DYNPRO    " Metric
*       align   = 15    " Alignment
        parent  = go_docking   " Parent Container
        rows    = 2    " Number of Rows to be displayed
        columns = 1    " Number of Columns to be Displayed
*       no_autodef_progid_dynnr =     " Don't Autodefined Progid and Dynnr?
*       name    =     " Name
      exceptions
*       cntl_error              = 1
*       cntl_system_error       = 2
        others  = 3.
    if sy-subrc <> 0.
*     message id sy-msgid type sy-msgty number sy-msgno
*                with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    endif.
    
    
    call method go_splitter->get_container
      exporting
        row       = 1    " Row
        column    = 1    " Column
      receiving
        container = go_cell_top.    " Container

    call method go_splitter->get_container
      exporting
        row       = 2    " Row
        column    = 1    " Column
      receiving
        container = go_cell_bottom.    " Container

    create object go_text_editor
      exporting
*       max_number_chars           =     " maximum number of characters insertable into editor control
*       style                      = 0    " control style, if initial a defined value is choosen
        wordwrap_mode              = cl_gui_textedit=>wordwrap_at_fixed_position    " 0: OFF; 1: wrap a window border; 2: wrap at fixed position
        wordwrap_position          = 0   " position of wordwrap, only makes sense with wordwrap_mode=2
        wordwrap_to_linebreak_mode = cl_gui_textedit=>true    " eq 1: change wordwrap to linebreak; 0: preserve wordwraps
*       filedrop_mode              = DROPFILE_EVENT_OFF    " event mode to handle drop of files on control
        parent                     = go_cell_top   " Parent Container
*       lifetime                   =     " for life time management
*       name                       =     " name for the control
      exceptions
*       error_cntl_create          = 1
*       error_cntl_init            = 2
*       error_cntl_link            = 3
*       error_dp_create            = 4
*       gui_type_not_supported     = 5
        others                     = 6.
    if sy-subrc <> 0.
* message id sy-msgid type sy-msgty number sy-msgno
*            with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    endif.
    
      perform set_text_editor.

    call method go_text_editor->set_text_as_r3table
      exporting
        table  = itext    " table with text
      exceptions
*       error_dp        = 1
*       error_dp_create = 2
        others = 3.
    if sy-subrc <> 0.
*     message id sy-msgid type sy-msgty number sy-msgno
*                with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    endif.
    
    
    create object go_alv
      exporting
*       i_shellstyle      = 0    " Control Style
*       i_lifetime        =     " Lifetime
        i_parent = go_cell_bottom    " Parent Container
*       i_appl_events     = SPACE    " Register Events as Application Events
*       i_parentdbg       =     " Internal, Do not Use
*       i_applogparent    =     " Container for Application Log
*       i_graphicsparent  =     " Container for Graphics
*       i_name   =     " Name
*       i_fcat_complete   = SPACE    " Boolean Variable (X=True, Space=False)
      exceptions
*       error_cntl_create = 1
*       error_cntl_init   = 2
*       error_cntl_link   = 3
*       error_dp_create   = 4
        others   = 5.
    if sy-subrc <> 0.
*     message id sy-msgid type sy-msgty number sy-msgno
*                with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    endif.


call method go_alv->set_table_for_first_display
      exporting
*       i_buffer_active  =     " Buffering Active
*       i_bypassing_buffer            =     " Switch Off Buffer
*       i_consistency_check           =     " Starting Consistency Check for Interface Error Recognition
        i_structure_name = 'SCARR'    " Internal Output Table Structure Name
*       is_variant       =     " Layout
*       i_save           =     " Save Layout
*       i_default        = 'X'    " Default Display Variant
*       is_layout        =     " Layout
*       is_print         =     " Print Control
*       it_special_groups             =     " Field Groups
*       it_toolbar_excluding          =     " Excluded Toolbar Standard Functions
*       it_hyperlink     =     " Hyperlinks
*       it_alv_graphics  =     " Table of Structure DTC_S_TC
*       it_except_qinfo  =     " Table for Exception Quickinfo
*       ir_salv_adapter  =     " Interface ALV Adapter
      changing
        it_outtab        = gt_scarr   " Output Table
*       it_fieldcatalog  =     " Field Catalog
*       it_sort          =     " Sort Criteria
*       it_filter        =     " Filter Criteria
*      exceptions
*       invalid_parameter_combination = 1
*       program_error    = 2
*       too_many_lines   = 3
*       others           = 4
      .
    if sy-subrc <> 0.
*     message id sy-msgid type sy-msgty number sy-msgno
*                with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    endif.
    
    
    set handler: lcl_handler=>handle_double_click for go_alv.

    call method go_docking->link
      exporting
        repid = syst-repid    " REPID
        dynnr = '0100'    " DYNNR
*       container                   =     " Container
*      exceptions
*       cntl_error                  = 1
*       cntl_system_error           = 2
*       lifetime_dynpro_dynpro_link = 3
*       others                      = 4
      .
    if sy-subrc <> 0.
*     message id sy-msgid type sy-msgty number sy-msgno
*                with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    endif.
        
  else.
    message 'Something goes wrong.' type 'I'.
  endif.

  call screen 0100.

end-of-selection.

*&---------------------------------------------------------------------*
*&      Module  STATUS_0100  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
module status_0100 output.
  set pf-status '0100'.  " contains push button "DETAIL"
*  SET TITLEBAR 'xxx'.

endmodule.                 " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
module user_command_0100 input.

  data(gd_okcode) = sy-ucomm.

  case gd_okcode.
    when '&BACK' or '&CANCEL' or '&EXIT'.
      set screen 0.
    when '&ADDTEXT'.
      perform add_text_ineditor.
*      if not go_text_editor is initial.
*        go_text_editor->free( ).
**        clear go_text_editor.
*      endif.

  endcase.
endmodule.

*&---------------------------------------------------------------------*
*&      Form  SET_TEXT_EDITOR
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form set_text_editor .

  xtext = 'This is a demo text editor.'.
  append xtext to itext.
  xtext = ' You can add more lines too.'.
  append xtext to itext.

endform.

*&---------------------------------------------------------------------*
*&      Form  ADD_TEXT_INEDITOR
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form add_text_ineditor .

*  if go_text_editor is not initial.
*    call method go_text_editor->delete_text.
*
*  endif.


*  data: lv_messa type char200.
*
*  lv_messa = | { go_counter } |.
*
*  message lv_messa type 'I'.

  if go_counter eq '0'.
    call method cl_gui_cfw=>flush.
    call method go_text_editor->delete_text.
    clear: itext.
  endif.

  field-symbols: <fs_sflight> type sflight.
  data: lv_mess type char200.

  call method go_alv->get_current_cell
    importing
      e_row = data(li_row)    " Row on Grid
*     e_value   =     " Value
*     e_col =     " Column on Grid
*     es_row_id =     " Row ID
*     es_col_id =     " Column ID
*     es_row_no =     " Numeric Row ID
    .
    
   if line_exists( gt_scarr[ li_row ] ).
    data(ls_scarr) = gt_scarr[ li_row ].

    select * from sflight into table @data(gt_sflight)
      where carrid = @ls_scarr-carrid.

*    cl_demo_output=>display( gt_sflight ).

    loop at gt_sflight assigning <fs_sflight>.
      concatenate 'Data: '
      <fs_sflight>-carrid
      into lv_mess
      separated by space.

      append lv_mess to itext.
    endloop.

*    call method cl_gui_cfw=>flush.
*    call method go_text_editor->delete_text.
*    if go_text_editor is not initial.
*    call method go_text_editor->delete_text.
*
*  endif.

     call method go_text_editor->set_text_as_stream
      exporting
        text = itext.

  else.
    message 'Something goes wrong' type 'I'.
  endif.

  go_counter = go_counter + 1.

endform.   
