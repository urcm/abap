data: lv_fdir  type eps2filnam value '/usr/sap/trans/'.

data: it_list type standard table of eps2fili with default key.

data: lv_dir_name type epsf-epsdirnam.
data: lv_file_counter type epsf-epsfilsiz.
data: lv_error_counter type epsf-epsfilsiz.


start-of-selection.

  call function 'EPS2_GET_DIRECTORY_LISTING'
    exporting
      iv_dir_name            = lv_fdir
*     file_mask              = ''
    importing
      dir_name               = lv_dir_name
      file_counter           = lv_file_counter
      error_counter          = lv_error_counter
    tables
      dir_list               = it_list
    exceptions
      invalid_eps_subdir     = 1
      sapgparam_failed       = 2
      build_directory_failed = 3
      no_authorization       = 4
      read_directory_failed  = 5
      too_many_read_errors   = 6
      empty_directory_list   = 7
      others                 = 8.

  if sy-subrc eq 0.

    loop at it_list assigning field-symbol(<f_list>).
      write: / <f_list>-name, <f_list>-size, <f_list>-mtim.
    endloop.

  endif.
