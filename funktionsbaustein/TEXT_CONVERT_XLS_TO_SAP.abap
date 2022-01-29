    
types: begin of ty_scarr,
         carrid   type  s_carr_id,
         carrname type  s_carrname,
         currcode type  s_currcode,
         url      type  s_carrurl,
       end of    ty_scarr.
       
data: itab_raw       type truxs_t_text_data.
data: gt_scarr type standard table of ty_scarr.

call function 'TEXT_CONVERT_XLS_TO_SAP'
  exporting
    i_field_seperator    = ';'
    i_line_header        = abap_true
    i_tab_raw_data       = itab_raw
    i_filename           = conv rlgrap-filename( 'C:\export.XLSX' )
  tables
    i_tab_converted_data = gt_scarr
  exceptions
    conversion_failed    = 1
    others               = 2.
if sy-subrc <> 0.
* Implement suitable error handling here
endif.

cl_demo_output=>display( gt_scarr ).
