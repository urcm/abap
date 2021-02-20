
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

start-of-selection.
  data(get_diff) = new cl_time( ).
  get_diff->diff_time( st_date = srt_dte en_date = end_dte ).
