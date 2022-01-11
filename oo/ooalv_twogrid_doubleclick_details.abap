
data: go_docking     type ref to cl_gui_docking_container,
      go_splitter    type ref to cl_gui_splitter_container,
      go_cell_top    type ref to cl_gui_container,
      go_cell_bottom type ref to cl_gui_container,
      go_grid1       type ref to cl_gui_alv_grid,
      go_grid2       type ref to cl_gui_alv_grid.

data: gs_layout type lvc_s_layo.

data: gt_scarr   type standard table of scarr,
      gt_sflight type standard table of sflight.
