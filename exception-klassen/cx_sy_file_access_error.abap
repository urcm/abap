data: file_path    type string value '/tmp/test_file.csv',
      file_content type string.
try.
    open dataset file_path for input in text mode encoding default ignoring conversion errors..

    if sy-subrc = 0.
      close dataset file_path.

      write: / |File exists.|.
    else.
      write: / |File doesn't exist.|.
    endif.

    if sy-subrc = 0.  
      do.
        read dataset file_path into file_content.
        if sy-subrc <> 0.  
          exit.
        endif.
        write: / file_content.
      enddo.
    endif.

  catch cx_sy_file_access_error into data(file_access_error).
    data(error_message) = |Fehler beim Zugriff auf die Datei: { file_access_error->get_text( ) }|.
    write: / error_message.
endtry.
