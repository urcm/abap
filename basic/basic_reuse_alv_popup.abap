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
  
