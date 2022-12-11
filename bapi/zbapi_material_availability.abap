data:  gs_wmdvsx type table of bapiwmdvs with header line,
       gs_wmdvex type table of bapiwmdve with header line.


selection-screen: begin of block i_form with frame title iv_form.
parameters: p_plant type werks,
            p_matnr type matnr,
            p_unit  type meins.
selection-screen: end of block i_form.


start-of-selection.

  call function 'BAPI_MATERIAL_AVAILABILITY'
    exporting
      plant    = p_plant
      material = p_matnr
      unit     = p_unit
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
