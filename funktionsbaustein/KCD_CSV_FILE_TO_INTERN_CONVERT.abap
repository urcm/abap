data it_csv type kcde_intern.

call function 'KCD_CSV_FILE_TO_INTERN_CONVERT'
  exporting
    i_filename  = 'C:\bank_data.csv'
    i_separator = ','
  tables
    e_intern    = it_csv
* EXCEPTIONS
*   UPLOAD_CSV  = 1
*   UPLOAD_FILETYPE       = 2
*   OTHERS      = 3
  .
if sy-subrc <> 0.
* Implement suitable error handling here
endif.

cl_demo_output=>display( it_csv ).
