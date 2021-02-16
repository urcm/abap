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
