*cat_check_rfc_destination  
* importing rfcdestination  type rfcdest  
* exporting msgv1  type syst_msgv  
*  msgv2  type syst_msgv  
*  rfc_subrc  type syst_subrc  
*
*
*Documentation
*
*Parameters
*
*
*importing  rfcdestination   System to be tested 
*exporting  msgv1   first part of a possible error message 
*exporting  msgv2   second part of a possible error message 
*exporting  rfc_subrc   Return code: 0=OK;1=No Dest;2=Comm.err;3=Sys.Err


data: lv_rfcdestination type rfcdest value 'IDS',
      lv_rfc_subrc      type syst_subrc,
      lv_msgv1  type syst_msgv.

call function 'CAT_CHECK_RFC_DESTINATION'
  exporting
    rfcdestination = lv_rfcdestination   " System to be tested
  importing
   msgv1          =  lv_msgv1   " first part of a possible error message
*   msgv2          =     " second part of a possible error message
    rfc_subrc      = lv_rfc_subrc.    " Return code: 0=OK;1=No Dest;2=Comm.err;3=Sys.Err

data(lv_mes) = switch char20( lv_rfc_subrc
                when 0 then 'OK.'
                when 1 then 'No Destination'
                when 2 then 'Communication error'
                when 3 then 'System error'
                ).

write :/ lv_mes, lv_msgv1.
write :/ sy-sysid, sy-mandt, sy-host.
