*th_get_virt_server
* importing value(protocol)  type char10 default 'HTTP'
* tables virt_server  type standard table of thfb_virt_server with header line


data: gt_virt_server  type standard table of thfb_virt_server.


call function 'TH_GET_VIRT_SERVER'
  exporting
    protocol    = 'HTTP'    " Type of log
  tables
    virt_server = gt_virt_server.


cl_demo_output=>display( gt_virt_server ).
