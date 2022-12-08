" Materials for a customer in his sales area 

data: gt_material type table of bapimakt.

call function 'BAPI_CUST_SAREAS_MATERIALS_GET'
  exporting
    customerno                 = '0000000021'
*   MATERIAL_GROUP             =
*   TEXTSTRING                 = '*'
*   TEXTLANGUAGE               = SY-LANGU
    specific_salesorganisation = '0001'
    specific_distr_channel     = '01'
* IMPORTING
*   NOTALLOWED                 =
*   RETURN                     =
  tables
    materials                  = gt_material
*   MESSAGETABLE               =
  .

loop at gt_material assigning field-symbol(<fs_material>).

  write: / <fs_material>-material,  <fs_material>-matl_desc.

endloop.
