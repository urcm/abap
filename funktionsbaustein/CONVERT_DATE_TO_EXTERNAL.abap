data date_as_ch type char10.

call function 'CONVERT_DATE_TO_EXTERNAL'
  exporting
    date_internal            = sy-datum
  importing
    date_external            = date_as_ch
  exceptions
    date_internal_is_invalid = 1.

write:/ date_as_ch.
