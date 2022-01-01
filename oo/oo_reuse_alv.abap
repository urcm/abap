
class reuse_alv definition.
  public section.
    methods constructor.

  private section.
    data: gt_scarr        type table of scarr,
          gt_fieldcatalog type slis_t_fieldcat_alv,
          gs_fieldcatalog type slis_fieldcat_alv,
          gs_layout       type slis_layout_alv,
          gt_events       type  slis_t_event,
          gs_events       type slis_alv_event.

    methods: get_data,
          set_fcat,
          set_layout,
          set_alv.
          
   methods: set_fc_details importing
                              f_name type string
                              selt_s type string
                              selt_m type string
                              selt_l type string.        
      
endclass.

class reuse_alv implementation.
  method constructor.

    get_data( ).
    set_fcat( ).
    set_layout( ).
    set_alv( ).

  endmethod.

  method get_data.

    select * up to 20 rows from scarr
      into table gt_scarr.

  endmethod.

  method set_fcat.
  
    set_fc_details(
      exporting
        f_name = 'CARRID'
        selt_s = 'Airline Code'
        selt_m = 'Airline Code'
        selt_l = 'Airline Code'
    ).

    set_fc_details(
          exporting
            f_name = 'CONNID'
            selt_s = 'Flight Num'
            selt_m = 'Flight Number'
            selt_l = 'Flight Connection Number'
     ).


    set_fc_details(
          exporting
            f_name = 'CARRNAME'
            selt_s = 'Airline name'
            selt_m = 'Airline name'
            selt_l = 'Airline name'
     ).  

*    gs_fieldcatalog-fieldname = 'CARRID'.
*    gs_fieldcatalog-seltext_s = 'Airline Code'.
*    gs_fieldcatalog-seltext_m = 'Airline Code'.
*    gs_fieldcatalog-seltext_l = 'Airline Code'.
*    append gs_fieldcatalog to gt_fieldcatalog.
*    clear: gs_fieldcatalog.
*
*    gs_fieldcatalog-fieldname = 'CARRNAME'.
*    gs_fieldcatalog-seltext_s = 'Airline name'.
*    gs_fieldcatalog-seltext_m = 'Airline name'.
*    gs_fieldcatalog-seltext_l = 'Airline name'.
*    append gs_fieldcatalog to gt_fieldcatalog.
*    clear: gs_fieldcatalog.
*
*    gs_fieldcatalog-fieldname = 'CURRCODE'.
*    gs_fieldcatalog-seltext_s = 'Currency'.
*    gs_fieldcatalog-seltext_m = 'Airline Currency'.
*    gs_fieldcatalog-seltext_l = 'Local currency of airline'.
*    append gs_fieldcatalog to gt_fieldcatalog.
*    clear: gs_fieldcatalog.
*
*    gs_fieldcatalog-fieldname = 'URL'.
*    gs_fieldcatalog-seltext_s = 'Airline URL'.
*    gs_fieldcatalog-seltext_m = 'AAirline URL'.
*    gs_fieldcatalog-seltext_l = 'Airline URL'.
*    append gs_fieldcatalog to gt_fieldcatalog.
*    clear: gs_fieldcatalog. 

  endmethod.
  
 method set_layout.
 
    gs_layout-window_titlebar   = 'Reuse ALV in OO Use'.
    gs_layout-zebra             = abap_true.
    gs_layout-colwidth_optimize = abap_true.
    
  endmethod.
  
    method set_fc_details.

    gs_fieldcatalog-fieldname = f_name.
    gs_fieldcatalog-seltext_s = selt_s.
    gs_fieldcatalog-seltext_m = selt_m.
    gs_fieldcatalog-seltext_l = selt_l.

    append gs_fieldcatalog to gt_fieldcatalog.
    clear: gs_fieldcatalog.

  endmethod.
  
    method set_alv.

    call function 'REUSE_ALV_GRID_DISPLAY'
      exporting
*       I_INTERFACE_CHECK  = ' '
*       I_BYPASSING_BUFFER = ' '
*       I_BUFFER_ACTIVE    = ' '
        i_callback_program = sy-repid
*       I_CALLBACK_PF_STATUS_SET          = ' '
        I_CALLBACK_USER_COMMAND           = 'USER_COMMAND'
*       I_CALLBACK_TOP_OF_PAGE            = ' '
*       I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*       I_CALLBACK_HTML_END_OF_LIST       = ' '
*       I_STRUCTURE_NAME   =
*       I_BACKGROUND_ID    = ' '
*       I_GRID_TITLE       =
*       I_GRID_SETTINGS    =
        IS_LAYOUT          = gs_layout
        it_fieldcat        = gt_fieldcatalog
*       IT_EXCLUDING       =
*       IT_SPECIAL_GROUPS  =
*       IT_SORT            =
*       IT_FILTER          =
*       IS_SEL_HIDE        =
*       I_DEFAULT          = 'X'
*       I_SAVE             = ' '
*       IS_VARIANT         =
        IT_EVENTS          = gt_events
*       IT_EVENT_EXIT      =
*       IS_PRINT           =
*       IS_REPREP_ID       =
*       I_SCREEN_START_COLUMN             = 0
*       I_SCREEN_START_LINE               = 0
*       I_SCREEN_END_COLUMN               = 0
*       I_SCREEN_END_LINE  = 0
*       I_HTML_HEIGHT_TOP  = 0
*       I_HTML_HEIGHT_END  = 0
*       IT_ALV_GRAPHICS    =
*       IT_HYPERLINK       =
*       IT_ADD_FIELDCAT    =
*       IT_EXCEPT_QINFO    =
*       IR_SALV_FULLSCREEN_ADAPTER        =
*     IMPORTING
*       E_EXIT_CAUSED_BY_CALLER           =
*       ES_EXIT_CAUSED_BY_USER            =
      tables
        t_outtab           = gt_scarr
*     EXCEPTIONS
*       PROGRAM_ERROR      = 1
*       OTHERS             = 2
      .
    if sy-subrc <> 0.
* Implement suitable error handling here
    endif.

  endmethod.
  endclass.


form top_of_page.

  data: gt_header type slis_t_listheader,
        gs_header type slis_listheader.

  data: l_date type char10.
  write sy-datum to l_date.

  clear: gs_header.
  gs_header-typ = 'H'.
  concatenate sy-repid '-' 'Date' l_date into gs_header-info separated by space.
  append gs_header to gt_header.

  clear: gs_header.
  gs_header-typ = 'S'.
  gs_header-info = sy-title.
  append gs_header to gt_header.

  clear: gs_header.
  gs_header-typ = 'A'.
  gs_header-info = sy-uname.
  append gs_header to gt_header.

  call function 'REUSE_ALV_COMMENTARY_WRITE'
    exporting
      it_list_commentary = gt_header
*     I_LOGO             =
*     I_END_OF_LIST_GRID =
*     I_ALV_FORM         =
    .



endform.
  
form user_command using gs_ucomm like sy-ucomm
                        gs_selfield type slis_selfield.

  break-point.
  case gs_ucomm.
    when '&IC1'.
      message gs_selfield-value type 'I'.

  endcase.

endform.


start-of-selection.
  data(ralv) = new reuse_alv( ).
  create object ralv.

