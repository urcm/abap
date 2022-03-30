type-pools: slis.
data: gt_sflight  type sflight occurs 0,
      gs_caller  type slis_data_caller_exit,
      gs_selfield type slis_selfield,
      gt_fieldcat type slis_t_fieldcat_alv with header line.    

selection-screen skip.

selection-screen begin of line.
selection-screen pushbutton 2(30) but_data user-command button_clicked.
selection-screen end of line.

