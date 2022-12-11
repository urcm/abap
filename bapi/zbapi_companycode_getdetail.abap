
data: gt_companycode_detail  like bapi0002_2,
      gt_companycode_address like bapi0002_3,
      gv_return              like bapireturn.

call function 'BAPI_COMPANYCODE_GETDETAIL'
  exporting
    companycodeid       = '0001'
  importing
    companycode_detail  = gt_companycode_detail
    companycode_address = gt_companycode_address
    return              = gv_return.

if sy-subrc = 0.

  write :/  gt_companycode_detail-comp_name, gt_companycode_detail-city, gt_companycode_detail-country.

endif.
