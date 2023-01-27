
" CONVERSION_EXIT_CUNIT_OUTPUT ist der Konvertierungsexit, der verwendet wird, um eine interne Maßeinheit in die kaufmännische Einheit umzurechnen

data: gv_input  type char20,
      gv_output type char20,
      gv_s_text type char20,
      gv_l_text type char20.

gv_input = 'ST'.

call function 'CONVERSION_EXIT_CUNIT_OUTPUT'
  exporting
    input          = gv_input
    language       = sy-langu
  importing
    long_text      = gv_l_text
    output         = gv_output
    short_text     = gv_s_text
  exceptions
    unit_not_found = 1
    others         = 2.
if sy-subrc = 0.
  write :/ gv_output , gv_l_text, gv_s_text.
  clear: gv_output.
endif.
