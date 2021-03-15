
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
    methods: diff_day importing
                        st_date type sy-datum
                        en_date type sy-datum.

    methods: diff_mo importing
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

  method diff_day.
    data: df_day type i.

    df_day = cl_reca_date=>get_days_between_two_dates(
                                                  exporting
                                                    id_datefrom = st_date
                                                    id_dateto = en_date
                                                    ).
    write :/ | { df_day } days |.
  endmethod.

  method diff_mo.
    data: df_mo type i.
    df_mo = cl_reca_date=>months_between_two_dates(
                                                  exporting
                                                    id_date_from = st_date
                                                    id_date_to = en_date
                                                    ).
    write:/ | { df_mo } months |.
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

at selection-screen output.
  case so_ucomm.
    when 'UPD'.
      if sel_mo eq 'X'.
        loop at screen.
          if screen-name cs 'hms_res'.
            screen-input = 0.
            modify screen.
          elseif screen-name cs 'ymd_res'.
            screen-input = 0.
            modify screen.
          endif.
          modify screen.
        endloop.
      else.
        loop at screen.
          if screen-name cs 'dm_dy'.
            screen-input = 0.
            modify screen.
          elseif screen-name cs 'dm_mo'.
            screen-input = 0.
            modify screen.
          endif.
        endloop.
      endif.
  endcase.

initialization.
  loop at screen.
    if screen-name cs 'dm_dy' or screen-name cs 'dm_mo'.
      screen-active = 1.
      screen-input = 0.
      modify screen.
    endif.
  endloop.

  frm_gr = 'Select your date'.
  frm_rd = 'Select your result type'.
  frm_dm = 'Select result day/month'.
  %_srt_dte_%_app_%-text = 'Start Date'.
  %_end_dte_%_app_%-text = 'End Date'.
  %_hms_res_%_app_%-text = 'Hrs/Min/Sec/'.
  %_ymd_res_%_app_%-text = 'Yr/Mo/Day'.
  %_sel_dt_%_app_%-text = 'Full Difference'.
  %_sel_mo_%_app_%-text = 'Just Date/Month'.
  %_dm_dy_%_app_%-text = 'Day Difference'.
  %_dm_mo_%_app_%-text = 'Month Difference'.

start-of-selection.
  data(get_diff) = new cl_time( ).
  if sel_dt eq 'X'.
    if hms_res eq 'X'.
      get_diff->diff_time( st_date = srt_dte en_date = end_dte ).
    elseif ymd_res eq 'X'.
      get_diff->diff_date( st_date = srt_dte en_date = end_dte ).
    endif.
  else.
    if dm_dy eq 'X'.
      get_diff->diff_day( st_date = srt_dte en_date = end_dte ).
    else.
      get_diff->diff_mo( st_date = srt_dte en_date = end_dte ).
    endif.
  endif.
