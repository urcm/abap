***********************************************************
*
* Die schnellste interne Tabelle ist eine Hash-Tabelle. Dann ist es die Sort-Tabelle.
*
***********************************************************


*data: gt_scarr type standard table of scarr with default key. " 0,002653 s
*data: gt_scarr type sorted table of scarr with unique key carrid. " 0,001022 s
data: gt_scarr type  hashed table of scarr with unique key carrid. " 0,000719 s

data(go_timer) = cl_abap_runtime=>create_hr_timer( ).
data(usec_start) = go_timer->get_runtime( ).

select * from scarr into table gt_scarr up to 200 rows.


loop at gt_scarr assigning field-symbol(<fs_scarr>).
  
  write :/  <fs_scarr>.

endloop.



data(usec_end) = go_timer->get_runtime( ).
data(usec) = conv decfloat16( usec_end - usec_start ).
data(sec) = usec / 1000000.

write: / 'Laufzeit:', sec, 's'.
