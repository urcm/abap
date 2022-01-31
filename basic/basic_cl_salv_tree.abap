
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

      go_tree->get_tree_settings( )->set_hierarchy_size( value = 40 ).

      loop at gt_spfli assigning field-symbol(<fs_spfli>) group by <fs_spfli>-carrid.

        data(go_subs) = go_tree->get_nodes( )->add_node(
                                        related_node   = ''
                                        relationship   = cl_gui_column_tree=>relat_last_child
*                                        data_row       =
                                        collapsed_icon = conv #( icon_closed_folder )
                                        expanded_icon  = conv #( icon_open_folder )
                                        row_style      = if_salv_c_tree_style=>intensified
                                        text           = conv #( <fs_spfli>-carrid )
*                                        visible        = ABAP_TRUE
*                                        expander       =
*                                        enabled        = ABAP_TRUE
*                                        folder         =
                                    ).
*      catch cx_salv_msg.  "
