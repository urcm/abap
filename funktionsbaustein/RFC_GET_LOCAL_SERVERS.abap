** rfc_get_local_servers
** tables hosts  type standard table of msxxlist with header line
** exceptions  not_available
*
*data: gt_hosts type standard table of msxxlist.
*
*
*call function 'RFC_GET_LOCAL_SERVERS'
*  tables
*    hosts         = gt_hosts
*  exceptions
*    not_available = 1
*    others        = 2.
*if sy-subrc eq 0.
*  cl_demo_output=>display( gt_hosts ).
*endif.
