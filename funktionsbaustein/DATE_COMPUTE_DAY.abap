data: gv_today like scal-date,
      gv_day   like scal-indicator.


call function 'DATE_COMPUTE_DAY'
  exporting
    date = gv_today   " Date of weekday to be calculated
  importing
    day  = gv_day. " Weekday


data(lv_day) = switch char20( gv_day
when 1 then 'Heute ist Montag'
when 2 then 'Heute ist Dienstag'
when 3 then 'Heute ist Mittwoch'
when 4 then 'Heute ist Donnerstag'
when 5 then 'Heute ist Freitag'
when 6 then 'Heute ist Samstag'
when 7 then 'Heute ist Sonntag' ).

write :/ lv_day.
