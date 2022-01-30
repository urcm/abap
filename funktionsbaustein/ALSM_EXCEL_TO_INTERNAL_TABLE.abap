data: lt_tab type standard table of alsmex_tabline. "OCCURS 0 WITH HEADER LINE.
*      lv_filename type rlgrap-filename.

call function 'ALSM_EXCEL_TO_INTERNAL_TABLE'
  exporting
    filename    = conv rlgrap-filename( 'C:\Users\...\export.XLSX' )
    i_begin_col = 1
    i_begin_row = 1
    i_end_col   = 12
    i_end_row   = 99999
  tables
    intern      = lt_tab
  exceptions
*   INCONSISTENT_PARAMETERS       = 1
*   UPLOAD_OLE  = 2
    others      = 3.
if sy-subrc <> 0.
* Implement suitable error handling here
endif.

cl_demo_output=>display( lt_tab ).
