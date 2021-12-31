types: begin of g_tab,
         carrid type scarr-carrid,
         connid type sflight-connid,
       end of g_tab.

data: gt_tab type table of g_tab.

data: alv_container type ref to cl_gui_custom_container,
      alv_grid      type ref to cl_gui_alv_grid.

start-of-selection.

  select
    sc~carrid
    sf~connid
    sc~carrname
    from scarr as sc
    inner join sflight as sf on sf~carrid eq sc~carrid
    into corresponding fields of table gt_tab.

  sort gt_tab ascending by carrid.

  call screen 0100.
