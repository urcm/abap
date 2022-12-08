data: gt_material type mara.

parameters p_matnr type c length 18.

initialization.
  %_p_matnr_%_app_%-text = 'Material Nummer: '.


start-of-selection.

  call function 'NUMERIC_CHECK'
    exporting
      string_in  = p_matnr
    importing
      string_out = p_matnr.

  select single
    * from mara
    into gt_material where matnr = p_matnr.

  write /: gt_material-matnr, gt_material-ernam, gt_material-mtart, gt_material-meins.



