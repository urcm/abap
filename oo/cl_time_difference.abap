
class cl_time definition.
  public section.

    data: lv_sec type sytabix.
    data: calc_sec type i.
    data: calc_min(10) type c.
    data: calc_hrs(12) type c.

    methods: diff_time importing
                         st_date type sy-datum
                         en_date type sy-datum.
    methods: diff_date importing
                         st_date type sy-datum
                         en_date type sy-datum.

    methods: res_diff.

endclass.

class cl_time implementation.
  method diff_time.
    call function 'SWI_DURATION_DETERMINE'
      exporting
        start_date = st_date
        end_date   = en_date
        start_time = sy-uzeit
        end_time   = sy-uzeit
      importing
        duration   = lv_sec.

    calc_sec = lv_sec.
    calc_min = calc_sec / 60 .
    calc_hrs = calc_sec / 3600 .

    res_diff( ).
  endmethod.

  method res_diff.
    write :/ | { calc_hrs } hours |.
    write :/ | { calc_min } minutes |.
    write :/ | { calc_sec } seconds |.
  endmethod.

  method diff_date.

    data: calc_years type i.
    data: calc_months type i.
    data: calc_days type i.

    cl_reca_date=>get_date_diff( exporting
                                   id_date_from     = st_date
                                   id_date_to       = en_date
                                 importing
                                   ed_years         = calc_years
                                   ed_months        = calc_months
                                   ed_calendar_days = calc_days
                               ).

    
    write :/ | { calc_years } years |.
    write :/ | { calc_months } months |.
    write :/ | { calc_days } days |.

  endmethod.
endclass.

selection-screen: begin of block p_form with frame title frm_gr.
parameters: srt_dte type sy-datum,
            end_dte type sy-datum.
selection-screen: end of block p_form.

selection-screen: begin of block sel_form with frame title frm_sl.
parameters: sel_dt radiobutton group rg1 user-command upd,
            sel_mo radiobutton group rg1.
selection-screen: end of block sel_form.

selection-screen: begin of block r_form with frame title frm_rd.
parameters: hms_res radiobutton group rg2,
            ymd_res radiobutton group rg2.
selection-screen: end of block r_form.

selection-screen: begin of block dm_form with frame title frm_dm.
parameters: dm_dy radiobutton group rg3,
            dm_mo radiobutton group rg3.
selection-screen: end of block dm_form.

data: so_ucomm type sy-ucomm.

at selection-screen.
  so_ucomm = sy-ucomm.
  if sy-ucomm eq 'UPD'.
    " 
  endif.

initialization.
  frm_gr = 'Selecet your date'.
  frm_rd = 'Select your result type'.
  %_srt_dte_%_app_%-text = 'Start Date'.
  %_end_dte_%_app_%-text = 'End Date'.
  %_hms_res_%_app_%-text = 'Hour/Minute/Second'.
  %_ymd_res_%_app_%-text = 'Year/Month/Day'.

start-of-selection.
  data(get_diff) = new cl_time( ).
  case 'X'.
    when hms_res.
      get_diff->diff_time( st_date = srt_dte en_date = end_dte ).
    when ymd_res.
      get_diff->diff_date( st_date = srt_dte en_date = end_dte ).
  endcase.
