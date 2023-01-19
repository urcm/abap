 data: gt_params    type standard table of rfc_spagpa,
       gt_bdcmsgmsg type standard table of bdcmsgcoll.

 data: lv_mode   type sy-ftype,
       lv_update type sy-ftype.

 lv_mode = 'A'.
* A = Ausführen im Vordergrund
* E = Ausführen im Hintergrund, aber Stoppen bei Fehler
* N = Ausführen im Hintergrund, sammeln Fehler in Fehlertabelle
* P = Ausführen im Hintergrund, sammeln Fehler in Fehlertabelle

 lv_update = 'S'.

* A = Asynchrone verbuchung.
* S = Synchrone Verbuchung.
* L = Lokale Verbuchung.

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
     
*  call transaction 'XK01' using gt_bdcdata
*                     mode 'A' update 'S' messages into gt_bdcmsg.
    
 data(lv_result) = switch char20( sy-subrc
    when 0 then 'Saved'
    when 1 then 'Call Transaction Denied'
    when 2 then 'T-Code Invalid'
    else 'Error Occured '
 ).

 write :/ lv_result.
