class cl_time definition.
  public section.

    data: lv_sec type sytabix.
    data: calc_sec type i.
    data: calc_min(10) type c.
    data: calc_hrs(12) type c.

    methods: diff_time importing
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
endclass.


selection-screen: begin of block p_form with frame title frm_gr.
parameters: srt_dte type sy-datum,
            end_dte type sy-datum.
selection-screen: end of block p_form.

start-of-selection.
  data(get_diff) = new cl_time( ).
  get_diff->diff_time( st_date = srt_dte en_date = end_dte ).
