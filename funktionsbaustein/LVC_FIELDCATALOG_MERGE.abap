types: begin of ts_sflight.
         include type sflight.
         types: light type c length 1,
       end of ts_sflight.

data: gt_sflight type standard table of ts_sflight.
data: gt_fieldcat type lvc_t_fcat,
      gs_fieldcat type lvc_s_fcat.

data gs_layout type lvc_s_layo.


    call function 'LVC_FIELDCATALOG_MERGE'
      exporting
        i_structure_name = 'SFLIGHT'
      changing
        ct_fieldcat      = gt_fieldcat.
