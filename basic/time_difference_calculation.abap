data dist_days type i.
data dist_mo type i.

dist_days = cl_reca_date=>get_days_between_two_dates( 
                                                    exporting
                                                              id_datefrom = '20210201'
                                                              id_dateto = sy-datum 
                                                              ).
write :/ dist_days.


dist_mo   = cl_reca_date=>months_between_two_dates(
                                                 exporting
                                                   id_date_from = '20200201'
                                                   id_date_to = sy-datum
                                                   ).

write :/ dist_mo.




data : lv_sec type sytabix.
data : calc_sec     type i.
data : calc_min(10) type c.
data : calc_hrs(12) type c.

call function 'SWI_DURATION_DETERMINE'
  exporting
    start_date = '20210101'
    end_date   = '20210102'
    start_time = sy-uzeit
    end_time   = sy-uzeit
  importing
    duration   = lv_sec.

calc_sec = lv_sec.
calc_min = calc_sec / 60 .
calc_hrs = calc_sec / 3600 .
