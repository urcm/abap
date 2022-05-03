
tables: scarr.

types: begin of ty_scarr,
         carrid   type  s_carr_id,
         carrname type  s_carrname,
         currcode type  s_currcode,
         url      type  s_carrurl,
       end of ty_scarr.

data: gt_scarr type table of ty_scarr.
*data: gt_scarr type ty_scarr occurs 0.
data : go_file type string.
data : fl_file type rlgrap-filename.

select * from scarr into corresponding fields of table gt_scarr up to 5 rows.
  
call function 'F4_FILENAME'  
  exporting
*   PROGRAM_NAME        = SYST-CPROG
*   DYNPRO_NUMBER       = SYST-DYNNR
    field_name = 'FL_FILE'
  importing
    file_name  = fl_file.

go_file = fl_file.          

call function 'GUI_DOWNLOAD'
  exporting
*   BIN_FILESIZE            =
    filename                = go_file
    filetype                = 'ASC'
*   APPEND                  = ' '
    write_field_separator   = 'X'
*   HEADER                  = '00'
*   TRUNC_TRAILING_BLANKS   = ' '
    write_lf                = 'X'
*   COL_SELECT              = ' '
*   COL_SELECT_MASK         = ' '
*   DAT_MODE                = ' '
*   CONFIRM_OVERWRITE       = ' '
*   NO_AUTH_CHECK           = ' '
*   CODEPAGE                = ' '
*   IGNORE_CERR             = ABAP_TRUE
*   REPLACEMENT             = '#'
*   WRITE_BOM               = ' '
*   TRUNC_TRAILING_BLANKS_EOL       = 'X'
*   WK1_N_FORMAT            = ' '
*   WK1_N_SIZE              = ' '
*   WK1_T_FORMAT            = ' '
*   WK1_T_SIZE              = ' '
* IMPORTING
*   FILELENGTH              =
  tables
    data_tab                = gt_scarr
*   FIELDNAMES              =
  exceptions
    file_write_error        = 1
    no_batch                = 2
    gui_refuse_filetransfer = 3
    invalid_type            = 4
    no_authority            = 5
    unknown_error           = 6
    header_not_allowed      = 7
    separator_not_allowed   = 8
    filesize_not_allowed    = 9
    header_too_long         = 10
    dp_error_create         = 11
    dp_error_send           = 12
    dp_error_write          = 13
    unknown_dp_error        = 14
    access_denied           = 15
    dp_out_of_memory        = 16
    disk_full               = 17
    dp_timeout              = 18
    file_not_found          = 19
    dataprovider_exception  = 20
    control_flush_error     = 21
    others                  = 22.

if sy-subrc <> 0.
* Implement suitable error handling here
endif.

cl_demo_output=>display( gt_scarr ).
