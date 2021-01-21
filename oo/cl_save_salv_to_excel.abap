
class export_xl definition.
  public section.

    data: alv type ref to cl_salv_table.
    data: ta_sflight type standard table of sflight.

    data: fl_size type i.
    data: it_rawdata type xml_rawdata.

    methods: get_data.
    
  private section.
    methods: initialize_alv.
    methods: display.
    methods: convert_raw.
    methods:  save_as_xls.

endclass.


class export_xl implementation.

  method get_data.
    select * from sflight
      into table @ta_sflight
      up to 100 rows.


    initialize_alv( ).
    convert_raw( ).
    save_as_xls( ).
  endmethod.

  method initialize_alv.
    try.
        cl_salv_table=>factory(
        importing
          r_salv_table = alv
          changing
            t_table = ta_sflight
        ).
      catch cx_salv_msg into data(message).
        "get error handling.
    endtry.
  endmethod.

  method display.
    alv->display( ).
  endmethod.

  method convert_raw.
    data(fl_xml_bytes) = alv->to_xml( xml_type = if_salv_bs_xml=>c_type_xlsx ).

    cl_scp_change_db=>xstr_to_xtab( exporting
                                      im_xstring = fl_xml_bytes
                                    importing
                                      ex_size = fl_size
                                      ex_xtab = it_rawdata ).
  endmethod.

  method save_as_xls.

    if lines( it_rawdata ) > 0.
      data: fl_action type i.
      data: fl_filename type string.
      data: fl_fullpath type string.
      data: fl_path type string.

      try.
          cl_gui_frontend_services=>file_save_dialog( exporting
                                                        default_extension = 'xlsx'
                                                        default_file_name = 'salv_export.xlsx'
                                                        file_filter       = |Excel-File (*.xlsx)\|*.xlsx\|{ cl_gui_frontend_services=>filetype_all }|
                                                        prompt_on_overwrite = abap_true
                                                       changing
                                                         filename = fl_filename
                                                         path     = fl_path
                                                         fullpath = fl_fullpath
                                                         user_action = fl_action ).
       catch cx_root into data(error_txt).
          message error_txt->get_text( ) type 'S'.
      endtry.
    endif.
  endmethod.

endclass.

start-of-selection.
  data(exp_xl) = new export_xl( ).
  exp_xl->get_data( ) .                                                       
                                                         
