 data: gt_params type standard table of rfc_spagpa.
       gt_bdcmsgmsg    type standard table of bdcmsgcoll.

  data: lv_mode   type sy-ftype,
      lv_update type sy-ftype.
 
  lv_mode = 'A'.
  lv_update = 'S'.  
  
  call function 'ABAP4_CALL_TRANSACTION' starting new task 'ZBDC_ERSTELLEN_VENDOR'
    exporting
      tcode                   = 'XK01'
      skip_screen             = abap_false
      mode_val                = lv_mode
      update_val              = lv_update
    tables
      using_tab               = gt_bdcdata
      spagpa_tab              = gt_params
      mess_tab                = gt_bdcmsg
    exceptions
      call_transaction_denied = 1
      tcode_invalid           = 2
      others                  = 3.
      
      
      
