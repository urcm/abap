***********************************************************
*
* Schleife mit Feldsymbolen schneller als Objektreferenzen
*
***********************************************************
                                                       

data: gt_scarr type standard table of scarr.

data(go_timer) = cl_abap_runtime=>create_hr_timer( ).
data(usec_start) = go_timer->get_runtime( ).

select * from scarr into table gt_scarr up to 200 rows.
  

loop at gt_scarr assigning field-symbol(<fs_scarr>).
  write :/  <fs_scarr>.

endloop.


*loop at gt_scarr reference into data(r_scarr).
*  write :/ r_scarr->*.
*endloop.


data(usec_end) = go_timer->get_runtime( ).
data(usec) = conv decfloat16( usec_end - usec_start ).
data(sec) = usec / 1000000.

write: / 'Laufzeit:', sec, 's'.
