
data: gt_scarr type standard table of scarr.
data: gt_return type table of ddshretval.

parameters: p_carrid type scarr-carrid.

at selection-screen on value-request for p_carrid.

  select * from scarr into table gt_scarr up to 20 rows.

  call function 'F4IF_INT_TABLE_VALUE_REQUEST'
    exporting
*     DDIC_STRUCTURE         = ' '
      retfield     = 'CARRID'
*     PVALKEY      = ' '
      dynpprog     = sy-repid
      dynpnr       = sy-dynnr
      dynprofield  = 'P_CARRID'
*     STEPL        = 0
      window_title = 'F4 Hilfe SCARR'
*     VALUE        = ' '
      value_org    = 'S'
*     MULTIPLE_CHOICE        = ' '
*     DISPLAY      = ' '
*     CALLBACK_PROGRAM       = ' '
*     CALLBACK_FORM          = ' '
*     CALLBACK_METHOD        =
*     MARK_TAB     =
*    IMPORTING
*     USER_RESET   =
    tables
      value_tab    = gt_scarr
*     FIELD_TAB    =
      return_tab   = gt_return
*     DYNPFLD_MAPPING        =
*    EXCEPTIONS
*     PARAMETER_ERROR        = 1
*     NO_VALUES_FOUND        = 2
*     OTHERS       = 3
    .
  if sy-subrc <> 0.
* Implement suitable error handling here
  endif.
  
