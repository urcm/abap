data gs_variant type disvariant.

selection-screen begin of block a1 with frame title text-001.
parameters pa_var type disvariant-variant.
selection-screen end of block a1.

initialization.
  gs_variant-report = sy-cprog.


at selection-screen on value-request for pa_var.
  call function 'REUSE_ALV_VARIANT_F4'
    exporting
      is_variant    = gs_variant
*     I_TABNAME_HEADER          =
*     I_TABNAME_ITEM            =
*     IT_DEFAULT_FIELDCAT       =
      i_save        = 'A'
*     I_DISPLAY_VIA_GRID        = ' '
    importing
*     E_EXIT        =
      es_variant    = gs_variant
    exceptions
      not_found     = 1
      program_error = 2.
  if sy-subrc = 0.
    pa_var = gs_variant-variant.
  endif.

