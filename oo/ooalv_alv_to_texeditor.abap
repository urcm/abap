data: gt_scarr type table of scarr.

data: itext type table of tline-tdline,
      xtext like line of itext.

data: go_docking     type ref to cl_gui_docking_container,
      go_splitter    type ref to cl_gui_splitter_container,
      go_cell_top    type ref to cl_gui_container,
      go_cell_bottom type ref to cl_gui_container,
      go_alv         type ref to cl_gui_alv_grid,
      go_text_editor type ref to cl_gui_textedit.

data: go_counter type i value 0.
