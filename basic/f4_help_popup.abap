types: begin of ty_scarr,
         carrid   type scarr-carrid,
         connid   type sflight-connid,
         carrname type scarr-carrname,
       end of ty_scarr.
       

selection-screen begin of block b1 with frame title title.

selection-screen begin of line.
selection-screen comment (20) lbl1.
parameters: p_carrid type scarr-carrid.
selection-screen end of line.

selection-screen end of block b1.

initialization.

  title = 'F4 Help Section'.
  lbl1 = 'Select Table: '.

*parameters: p_carrid type scarr-carrid.

at selection-screen on value-request for p_carrid.


  field-symbols: <fs_return> like line of it_return.

  refresh it_return[].

  select
     sc~carrid
     sf~connid
     sc~carrname
     from scarr as sc
     inner join sflight as sf on sf~carrid eq sc~carrid
     into corresponding fields of table it_scarr.
     
     
call function 'F4IF_INT_TABLE_VALUE_REQUEST'
    exporting
*     DDIC_STRUCTURE  = ' '
      retfield        = 'CARRID'
*     PVALKEY         = ' '
      dynpprog        = sy-repid
      dynpnr          = sy-dynnr
      dynprofield     = 'P_CARRID'
*     STEPL           = 0
      window_title    = 'refdsgsdg'
*     VALUE           = ' '
      value_org       = 'S'
*     MULTIPLE_CHOICE = ' '
*     DISPLAY         = ' '
*     CALLBACK_PROGRAM       = ' '
*     CALLBACK_FORM   = ' '
*     CALLBACK_METHOD =
*     MARK_TAB        =
* IMPORTING
*     USER_RESET      =
    tables
      value_tab       = it_scarr
*     FIELD_TAB       =
      return_tab      = it_return
*     DYNPFLD_MAPPING =
    exceptions
      parameter_error = 1
      no_values_found = 2
      others          = 3.
     
  if sy-subrc = 0.
    if lines( it_return ) > 0.
      message it_return[ 1 ]-fieldval type 'S'.
    endif.
  endif.
