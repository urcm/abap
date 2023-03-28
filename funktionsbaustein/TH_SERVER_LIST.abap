
*th_server_list
* importing value(services)  type mstypes default 255
*  value(sysservice)  type mssysservice default 0
*  value(active_server)  type i default 1
*  value(subsystem_aware)  type i default 1
* tables list  type standard table of msxxlist with header line optional
*  list_ipv6  type standard table of msxxlist_v6 with header line optional
* exceptions  no_server_list
*
*
*Documentation
*
*Get Server List
*
*Longtext Documentation  Longtext Documentation
*
*Parameters
*
*
*importing  services   BIT Vector of the Services (see Notes)
*importing  sysservice   Services of Application Server
*importing  active_server   Display Active Servers Only
*importing  subsystem_aware   With system separation only the servers of your own subsyste
*tables  list_ipv6   Internal Table for Storing the List

data: gt_list type standard table of msxxlist.


call function 'TH_SERVER_LIST'
*  exporting
*    services        = 255    " BIT Vector of the Services (see Notes)
*    sysservice      = 0    " Services of Application Server
*    active_server   = 1    " Display Active Servers Only
*    subsystem_aware = 1    " With system separation only the servers of your own subsyste
  tables
    list           = gt_list
*   list_ipv6      =     " Internal Table for Storing the List
  exceptions
    no_server_list = 1
    others         = 2.
if sy-subrc eq 0.
  cl_demo_output=>display( gt_list ).
endif.



*************************************************************
SYSTEM-CALL

data lv_server_name type c length 20.

** get the name of the current server.

call 'C_SAPGPARAM' id 'NAME' field 'rdisp/myname'
id 'VALUE' field lv_server_name.

write:/ lv_server_name input on.
