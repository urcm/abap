" CONVERSION_EXIT_CUNIT_INPUT ist der Konvertierungsexit, der zum Konvertieren einer kommerziellen Einheit verwendet wird.

data: gv_input  type char20,
      gv_output type char20.

gv_input = 'PC'.

call function 'CONVERSION_EXIT_CUNIT_INPUT'
  exporting
    input          = gv_input
    language       = sy-langu
  importing
    output         = gv_output
  exceptions
    unit_not_found = 1
    others         = 2.


if sy-subrc = 0.
  write :/ gv_output.
  clear: gv_output.
endif.
