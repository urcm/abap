parameters p_file type rlgrap-filename.

at selection-screen on value-request for p_file.
  clear p_file.

  call function 'F4_FILENAME'
    exporting
      field_name = 'p_file'
    importing
      file_name  = p_file.

start-of-selection.
  write :/ p_file.
