selection-screen: begin of block p_form with frame title frm_gr.
parameters: srt_dte type sy-datum,
            end_dte type sy-datum.
selection-screen: end of block p_form.

selection-screen: begin of block r_form with frame title frm_rd.
parameters: hms_res radiobutton group rg1,
            ymd_res radiobutton group rg1.
selection-screen: end of block r_form.

initialization.
  frm_gr = 'Select your date'.
  frm_rd = 'Select your result type'.
  %_srt_dte_%_app_%-text = 'Start Date'.
  %_end_dte_%_app_%-text = 'End Date'.
  %_hms_res_%_app_%-text = 'Hrs/Min/Sec/'.
  %_ymd_res_%_app_%-text = 'Yr/Mo/Day'.

start-of-selection.
  case 'X'.
    when hms_res.
      perform diff_time using srt_dte end_dte.
    when ymd_res.
      perform diff_date using srt_dte end_dte.
  endcase.
