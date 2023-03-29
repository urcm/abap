* find_db_application_server
* exporting value(servername)  type msname2
* exceptions no_application_server


data: gv_servername type msname2.

call function 'FIND_DB_APPLICATION_SERVER'
  importing
    servername            = gv_servername
  exceptions
    no_application_server = 1
    others                = 2.
if sy-subrc eq 0.
  write :/ gv_servername.
endif.
