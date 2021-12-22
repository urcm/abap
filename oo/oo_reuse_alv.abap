
class reuse_alv definition.
  public section.
    methods constructor.

  private section.
    data: gt_scarr        type table of scarr,
          gt_fieldcatalog type slis_t_fieldcat_alv,
          gs_fieldcatalog type slis_fieldcat_alv.

    methods: get_data,
      set_fcat,
      set_layout,
      set_alv.
endclass.

class reuse_alv implementation.
  method constructor.

    get_data( ).
    set_fcat( ).
    set_layout( ).
    set_alv( ).

  endmethod.

  method get_data.

    select * up to 20 rows from scarr
      into table gt_scarr.

  endmethod.

  method set_fcat.

    gs_fieldcatalog-fieldname = 'CARRID'.
    gs_fieldcatalog-seltext_s = 'Airline Code'.
    gs_fieldcatalog-seltext_m = 'Airline Code'.
    gs_fieldcatalog-seltext_l = 'Airline Code'.
    append gs_fieldcatalog to gt_fieldcatalog.
    clear: gs_fieldcatalog.

    gs_fieldcatalog-fieldname = 'CARRNAME'.
    gs_fieldcatalog-seltext_s = 'Airline name'.
    gs_fieldcatalog-seltext_m = 'Airline name'.
    gs_fieldcatalog-seltext_l = 'Airline name'.
    append gs_fieldcatalog to gt_fieldcatalog.
    clear: gs_fieldcatalog.

    gs_fieldcatalog-fieldname = 'CURRCODE'.
    gs_fieldcatalog-seltext_s = 'Currency'.
    gs_fieldcatalog-seltext_m = 'Airline Currency'.
    gs_fieldcatalog-seltext_l = 'Local currency of airline'.
    append gs_fieldcatalog to gt_fieldcatalog.
    clear: gs_fieldcatalog.

    gs_fieldcatalog-fieldname = 'URL'.
    gs_fieldcatalog-seltext_s = 'Airline URL'.
    gs_fieldcatalog-seltext_m = 'AAirline URL'.
    gs_fieldcatalog-seltext_l = 'Airline URL'.
    append gs_fieldcatalog to gt_fieldcatalog.
    clear: gs_fieldcatalog.

  endmethod.
  
 method set_layout.
 
    gs_layout-window_titlebar   = 'Reuse ALV in OO Use'.
    gs_layout-zebra             = abap_true.
    gs_layout-colwidth_optimize = abap_true.
    
  endmethod.
