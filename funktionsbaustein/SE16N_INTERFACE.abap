* se16n_interface
* importing value(i_tab)  type se16n_tab
*  value(i_edit)  type char1 default ' '
*  value(i_sapedit)  type char1 default ' '
*  value(i_no_txt)  type char1 default ' '
*  value(i_max_lines)  type sytabix default 500
*  value(i_line_det)  type char1 default ' '
*  value(i_display)  type char1 default 'X'
*  value(i_clnt_spez)  type char1 default ' '
*  value(i_clnt_dep)  type char1 default ' '
*  value(i_variant)  type slis_vari default ' '
*  value(i_old_alv)  type char1 default ' '
*  value(i_checkkey)  type char1 default ' '
*  value(i_tech_names)  type char1 default ' '
*  value(i_cwidth_opt_off)  type char1 default ' '
*  value(i_scroll)  type char1 default ' '
*  value(i_no_convexit)  type char1 default ' '
*  value(i_layout_get)  type char1 default ' '
*  value(i_add_field)  type char40 optional
*  value(i_add_fields_on)  type char1 optional
*  value(i_uname)  type syst_uname optional
*  value(i_hana_active)  type char1 default space
*  value(i_dbcon)  type dbcon_name default space
*  value(i_ojkey)  type tswappl default space
*  value(i_display_all)  type char1 default ' '
* exporting value(e_line_nr)  type sytabix
*  value(e_dref)  type any
*  value(et_fieldcat)  type lvc_t_fcat
* changing value(it_and_selfields)  type se16n_and_t optional
* tables it_selfields  type standard table of se16n_seltab with header line optional
*  it_output_fields  type standard table of se16n_output with header line optional
*  it_or_selfields  type standard table of se16n_or_seltab with header line optional
*  it_callback_events  type standard table of se16n_events_type with header line optional
*  it_add_up_curr_fields  type standard table of se16n_output with header line optional
*  it_add_up_quan_fields  type standard table of se16n_output with header line optional
*  it_sum_up_fields  type standard table of se16n_output with header line optional
*  it_group_by_fields  type standard table of se16n_output with header line optional
*  it_order_by_fields  type standard table of se16n_output with header line optional
*  it_aggregate_fields  type standard table of se16n_seltab with header line optional
*  it_toplow_fields  type standard table of se16n_seltab with header line optional
*  it_sortorder_fields  type standard table of se16n_seltab with header line optional
* exceptions  no_values
*
*
*Documentation
*
*Display table as full screen
*
*Parameters
*
*
*importing  i_tab   Table
*importing  i_edit   Single-Character Indicator
*importing  i_sapedit   Single-Character Indicator
*importing  i_no_txt   Do not select any texts
*importing  i_max_lines   Maximum Number of Hits
*importing  i_line_det   Only determine number of entries found
*importing  i_display   Display Results
*importing  i_clnt_spez   Client-dependent selection
*importing  i_clnt_dep   Table is client-dependent
*importing  i_variant   Layout
*importing  i_old_alv   Not ALV grid
*importing  i_checkkey   No foreign key check
*importing  i_tech_names   Technical Name as Column Heading
*importing  i_cwidth_opt_off   Deactivate Column Width Optimization
*importing  i_scroll   KeyColumnsScrolab.
*importing  i_no_convexit   Do not use conversion for output
*importing  i_layout_get   Get last layout automatically
*importing  i_add_field   Additional Field for Exit
*importing  i_add_fields_on   Use Field Exit
*importing  i_uname   User Name
*importing  i_hana_active   SAP HANA Mode Active
*importing  i_dbcon   Logical Name for a Database Connection
*importing  i_ojkey   Outer Join Definition
*importing  i_display_all   Selection of all Records
*exporting  e_line_nr   No. of entries found
*exporting  e_dref   Pointer to the Results List
*exporting  et_fieldcat   Output List Field Catalog
*changing  it_and_selfields   SE16N: Table Type for AND Link
*tables  it_selfields   Table Display: Selection Criteria
*tables  it_output_fields   Table Display: Output Fields
*tables  it_or_selfields   Transfer Table for Multiple Selection Criteria
*tables  it_callback_events   Event Table for SE16N
*tables  it_add_up_curr_fields   Table Display: CURR Fields to be Added by Row
*tables  it_add_up_quan_fields   Table Display: QUAN Fields to be Added by Row
*tables  it_sum_up_fields   Totaling Fields
*tables  it_group_by_fields   Grouping Fields
*tables  it_order_by_fields   Sort fields
*tables  it_aggregate_fields   Aggregation Fields
*tables  it_toplow_fields   Top Bottom Fields
*tables  it_sortorder_fields   Sort Sequence

