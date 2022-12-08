data: gv_plant type werks,
      gv_matnr type matnr,
      gv_unit  type meins.


data:  gs_wmdvsx type table of bapiwmdvs with header line,
       gs_wmdvex type table of bapiwmdve with header line.


gv_plant = '0001'.
gv_matnr = '0000000096'.
gv_unit = 'PC'.

start-of-selection.

  call function 'BAPI_MATERIAL_AVAILABILITY'
    exporting
      plant    = gv_plant
      material = gv_matnr
      unit     = gv_unit
*     CHECK_RULE               =
*     STGE_LOC =
*     BATCH    =
*     CUSTOMER =
*     DOC_NUMBER               =
*     ITM_NUMBER               =
*     WBS_ELEM =
*     STOCK_IND                =
*     DEC_FOR_ROUNDING         =
*     DEC_FOR_ROUNDING_X       =
*     READ_ATP_LOCK            =
*     READ_ATP_LOCK_X          =
*     MATERIAL_EVG             =
*     SGT_RCAT =
* IMPORTING
*     ENDLEADTME               =
*     AV_QTY_PLT               =
*     DIALOGFLAG               =
*     RETURN   =
    tables
      wmdvsx   = gs_wmdvsx
      wmdvex   = gs_wmdvex.


  write :/ gs_wmdvsx-delkz, gs_wmdvsx-req_date, gs_wmdvsx-req_qty, gs_wmdvex-req_qty.

