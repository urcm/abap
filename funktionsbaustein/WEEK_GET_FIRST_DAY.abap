data: l_week        like  scal-week,
      l_date        like scal-date,
      l_year        type char4,
      l_week_number type char2.


*call function 'DATE_GET_WEEK' * Sie erhalten auch die Woche des Jahres mit diesem FaBu. 
*  exporting
*    date         = sy-datum
*  importing
*    week         = l_week  
*  exceptions
*    date_invalid = 1
*    others       = 2.
*if sy-subrc <> 0.
*  exit.
*endif.
*

l_year = '2022'. " sy-datum+0(4)
l_week_number = '10'.

l_week = | { l_year }{ l_week_number } |.

write :/ l_week.


call function 'WEEK_GET_FIRST_DAY'
  exporting
    week         = l_week
  importing
    date         = l_date
  exceptions
    week_invalid = 1
    others       = 2.

if sy-subrc <> 0.
* Implement suitable error handling here
endif.

write :/ l_date.
