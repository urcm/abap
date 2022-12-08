" Materials for a customer in his sales area

data: gt_material type table of bapimakt.


selection-screen: begin of block e_form with frame title ev_form.
parameters: p_kunnr type kunnr,
            p_sorg  type vkorg,
            p_disc  type vtweg.
selection-screen: end of block e_form.

initialization.

  ev_form = 'Cust. Details'.
  %_p_kunnr_%_app_%-text = 'Customer Nummer'.
  %_p_sorg_%_app_%-text = 'Sales Org.'.
  %_p_disc_%_app_%-text = 'Distr. Channel'.

start-of-selection.

  call function 'NUMERIC_CHECK'
    exporting
      string_in  = p_kunnr
    importing
      string_out = p_kunnr.


  call function 'BAPI_CUST_SAREAS_MATERIALS_GET'
    exporting
      customerno                 = p_kunnr
      specific_salesorganisation = p_sorg
      specific_distr_channel     = p_disc
    tables
      materials                  = gt_material.

  loop at gt_material assigning field-symbol(<fs_material>).

    write: / <fs_material>-material,  <fs_material>-matl_desc.

  endloop.
