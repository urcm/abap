
types: begin of gty_scarr,
         carrid   type s_carr_id,
         carrname type  s_carrname,
         currcode type  s_currcode,
         url      type s_carrurl,
       end of gty_scarr.


data: gt_scarr        type table of gty_scarr,
      gt_fieldcatalog type slis_t_fieldcat_alv,
      gs_fieldcatalog type slis_fieldcat_alv,
      gs_layout       type slis_layout_alv.
      
select * from scarr
  into corresponding fields of table gt_scarr.
    
gs_fieldcatalog-fieldname = 'CARRID'.
gs_fieldcatalog-seltext_s = 'Airline Code'.
gs_fieldcatalog-seltext_m = 'Airline Code'.
gs_fieldcatalog-seltext_l = 'Airline Code'.
gs_fieldcatalog-fix_column = abap_true.
append gs_fieldcatalog to gt_fieldcatalog.
clear: gs_fieldcatalog.

gs_fieldcatalog-fieldname = 'CARRNAME'.
gs_fieldcatalog-seltext_s = 'Airline name'.
gs_fieldcatalog-seltext_m = 'Airline name'.
gs_fieldcatalog-seltext_l = 'Airline name'.
append gs_fieldcatalog to gt_fieldcatalog.
clear: gs_fieldcatalog.

gs_fieldcatalog-fieldname = 'CURRCODE'.
gs_fieldcatalog-seltext_s = 'Local Currency'.
gs_fieldcatalog-seltext_m = 'Local currency'.
gs_fieldcatalog-seltext_l = 'Local currency of airline'.
append gs_fieldcatalog to gt_fieldcatalog.
clear: gs_fieldcatalog.

gs_fieldcatalog-fieldname = 'URL'.
gs_fieldcatalog-seltext_s = 'Airline URL'.
gs_fieldcatalog-seltext_m = 'AAirline URL'.
gs_fieldcatalog-seltext_l = 'Airline URL'.
append gs_fieldcatalog to gt_fieldcatalog.
clear: gs_fieldcatalog.


gs_layout-window_titlebar = 'SCARR Reuse ALV Test'.
gs_layout-colwidth_optimize = abap_true.
gs_layout-zebra             = abap_true.


call function 'REUSE_ALV_GRID_DISPLAY'
  exporting
*   I_INTERFACE_CHECK  = ' '
*   I_BYPASSING_BUFFER = ' '
*   I_BUFFER_ACTIVE    = ' '
    i_callback_program = sy-repid
*   I_CALLBACK_PF_STATUS_SET          = ' '
*   I_CALLBACK_USER_COMMAND           = ' '
*   I_CALLBACK_TOP_OF_PAGE            = ' '
*   I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*   I_CALLBACK_HTML_END_OF_LIST       = ' '
*   I_STRUCTURE_NAME   =
*   I_BACKGROUND_ID    = ' '
*   I_GRID_TITLE       =
*   I_GRID_SETTINGS    =
    is_layout          = gs_layout
    it_fieldcat        = gt_fieldcatalog
*   IT_EXCLUDING       =
*   IT_SPECIAL_GROUPS  =
*   IT_SORT            =
*   IT_FILTER          =
*   IS_SEL_HIDE        =
*   I_DEFAULT          = 'X'
*   I_SAVE             = ' '
*   IS_VARIANT         =
*   IT_EVENTS          =
*   IT_EVENT_EXIT      =
*   IS_PRINT           =
*   IS_REPREP_ID       =
*   I_SCREEN_START_COLUMN             = 0
*   I_SCREEN_START_LINE               = 0
*   I_SCREEN_END_COLUMN               = 0
*   I_SCREEN_END_LINE  = 0
*   I_HTML_HEIGHT_TOP  = 0
*   I_HTML_HEIGHT_END  = 0
*   IT_ALV_GRAPHICS    =
*   IT_HYPERLINK       =
*   IT_ADD_FIELDCAT    =
*   IT_EXCEPT_QINFO    =
*   IR_SALV_FULLSCREEN_ADAPTER        =
* IMPORTING
*   E_EXIT_CAUSED_BY_CALLER           =
*   ES_EXIT_CAUSED_BY_USER            =
  tables
    t_outtab           = gt_scarr
* EXCEPTIONS
*   PROGRAM_ERROR      = 1
*   OTHERS             = 2
  .
if sy-subrc <> 0.
* Implement suitable error handling here
endif.
