
*  call_browser
* importing value(url)  type c default space
*  value(window_name)  type c default space
*  value(new_window)  type syst_datar default space
*  value(browser_type)  type oleapp optional
*  value(contextstring)  type sdok_ctxst optional
* exceptions  frontend_not_supported
*   frontend_error
*   prog_not_found
*   no_batch
*   unspecified_error
*
*
*Documentation
*
*Call browsers with instance management
*
*Longtext Documentation  Longtext Documentation
*
*Parameters
*
*
*importing  url   URL of Browser Call
*importing  window_name   Under ITS: Name of Browser Target Window
*importing  new_window   Under Win32: Open a New Window
*importing  browser_type   Obsolete: Do Not Use
*importing  contextstring   Obsolete: Do Not Use

data: lv_url type char50 value 'http://www.sap.de'.


call function 'CALL_BROWSER'
  exporting
    url                    = lv_url
    new_window             = abap_true
  exceptions
    frontend_not_supported = 1
    frontend_error         = 2
    prog_not_found         = 3
    no_batch               = 4
    unspecified_error      = 5
    others                 = 6.

if sy-subrc eq 0.
  write:/ 'OK.'.
endif.
