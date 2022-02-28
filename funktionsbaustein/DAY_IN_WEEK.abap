data: lv_wotnr type p.

call function 'DAY_IN_WEEK'
  exporting
    datum = sy-datum
  importing
    wotnr = lv_wotnr.

case lv_wotnr.
  when '1'.
    write :/ 'Montag'.
  when '2'.
    write :/ 'Dienstag'.
  when '3'.
    write :/ 'Mittwoch'.
  when '4'.
    write :/ 'Donnerstag'.
  when '5'.
    write :/ 'Freitag'.
  when '6'.
    write :/ 'Samstag'.
  when '7'.
    write :/ 'Sonntag'.
endcase.
