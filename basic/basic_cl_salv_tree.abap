
types: tt_spfli type table of spfli.

data: go_tree type ref to cl_salv_tree.
data: gt_spfli        type tt_spfli,
      gt_spfli_nodata type tt_spfli.

start-of-selection.

  select * from spfli into corresponding fields of table gt_spfli.

  sort gt_spfli by carrid.

  try .

      cl_salv_tree=>factory(
*  exporting
*    r_container   =     " Abstract Container for GUI Controls
*    hide_header   =     " Do Not Show Header
        importing
          r_salv_tree   =  go_tree   " ALV: Tree Model
        changing
          t_table       = gt_spfli_nodata
      ).
*  catch cx_salv_error.    "

