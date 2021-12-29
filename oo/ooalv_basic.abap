types: begin of g_tab,
         carrid type scarr-carrid,
         connid type sflight-connid,
       end of g_tab.

data: gt_tab type table of g_tab.

data: alv_container type ref to cl_gui_custom_container,
      alv_grid      type ref to cl_gui_alv_grid.
