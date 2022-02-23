data: date like scal-date, "Date for public holiday and factory calendars
      week like scal-week. "Factory calendar: Week

date = sy-datum.

call function 'DATE_GET_WEEK'
  exporting
    date         = date
  importing
    week         = week
  exceptions
    date_invalid = 1
    others       = 2.
if sy-subrc <> 0.
* Implement suitable error handling here
endif.

write :/ 'Heute ist', sy-datum.
write :/ 'Die Woche ist', week+4(2).
write :/ 'Das Jahr ist', week+0(4).
