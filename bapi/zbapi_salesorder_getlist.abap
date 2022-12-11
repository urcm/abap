data: gt_order type table of bapiorders.
data: gs_order type bapiorders,
      gv_kunnr type kunnr.

gv_kunnr = '0000000021'.


call function 'CONVERSION_EXIT_ALPHA_INPUT'
  exporting
    input  = gv_kunnr
  importing
    output = gv_kunnr.

call function 'BAPI_SALESORDER_GETLIST'
  exporting
    customer_number    = gv_kunnr
    sales_organization = '0001'
  tables
    sales_orders       = gt_order.

cl_demo_output=>display( gt_order ).

loop at gt_order into gs_order.

  write:/ gs_order-sd_doc, gs_order-itm_number,  gs_order-material, gs_order-short_text, gs_order-doc_date, gs_order-req_qty, gs_order-purch_no_c.

endloop.
