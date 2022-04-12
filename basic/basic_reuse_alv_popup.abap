type-pools: slis.
data: gt_sflight  type sflight occurs 0,
      gs_caller  type slis_data_caller_exit,
      gs_selfield type slis_selfield,
      gt_fieldcat type slis_t_fieldcat_alv with header line.    

selection-screen skip.

selection-screen begin of line.
selection-screen pushbutton 2(30) but_data user-command button_clicked.
selection-screen end of line.

at selection-screen.
  case sy-ucomm.
    when 'BUTTON_CLICKED'.
*      message 'Test' type 'I'.
      perform popup_reuse_alv.
  endcase.

initialization.

*  move: 'Daten empfangen' to but_data.
  but_data = |{ icon_execute_object }  Daten empfangen|.

start-of-selection.

  write: 'Fertig.'.
  
*&---------------------------------------------------------------------*
*&      Form  POPUP_REUSE_ALV
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form popup_reuse_alv .

  data: lv_title type char30 value 'Popup Window'.

  select * from sflight into table gt_sflightup to 50 rows.

  call function 'REUSE_ALV_FIELDCATALOG_MERGE'
    exporting
      i_structure_name = 'SFLIGHT'
    changing
      ct_fieldcat      = gt_fieldcat[].
      
  call function 'REUSE_ALV_POPUP_TO_SELECT'
    exporting
      i_title       = lv_title
*     I_SELECTION   = 'X'
*     I_ZEBRA       = ' '
*     I_SCREEN_START_COLUMN   = 0
*     I_SCREEN_START_LINE     = 0
*     I_SCREEN_END_COLUMN     = 0
*     I_SCREEN_END_LINE       = 0
*     I_CHECKBOX_FIELDNAME    =
*     I_LINEMARK_FIELDNAME    =
*     I_SCROLL_TO_SEL_LINE    = 'X'
      i_tabname     = '1'
      it_fieldcat   = gt_fieldcat[]
*     IT_EXCLUDING  =
*     I_CALLBACK_PROGRAM      =
*     I_CALLBACK_USER_COMMAND =
      is_private    = gs_caller
    importing
      es_selfield   = gs_selfield
      e_exit        = g_exit
    tables
      t_outtab      = gt_outtab
    exceptions
      program_error = 1
      others        = 2.
  if sy-subrc <> 0.
    message i000(0k) with sy-subrc.
  endif.
  
*  write: / gs_selfield-tabname,
*           gs_selfield-tabindex,
*           gs_selfield-fieldname,
*           gs_selfield-value.

  perform result_screen using gs_selfield-fieldname gs_selfield-value.
  
endform.
