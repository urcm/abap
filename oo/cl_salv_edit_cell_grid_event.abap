
class lcl_salv_edit definition.
  public section.

    methods : constructor.
    
    data: gt_scarr type standard table of scarr.
    data: go_alv type ref to cl_salv_table.
    data: selections type ref to cl_salv_selections.
    data: fcat type lvc_t_fcat.

    methods: get_data.
    methods: create_salv.
    methods: salv_refresh for event after_refresh of cl_gui_alv_grid importing sender.

  private section.
    data:handler_check type abap_bool.
  
endclass.

class lcl_salv_edit implementation.

  method constructor.
    get_data( ).
    create_salv( ).
  endmethod.  
   
  method get_data.

    select * from scarr into table gt_scarr.

  endmethod.
  
  method create_salv.
        cl_salv_table=>factory(
*      exporting
*        list_display   = IF_SALV_C_BOOL_SAP=>FALSE    " ALV Displayed in List Mode
*        r_container    =     " Abstract Container for GUI Controls
*        container_name =
      importing
        r_salv_table   = go_alv    " Basis Class Simple ALV Tables
      changing
        t_table        = gt_scarr
    ).
*      catch cx_salv_msg.    "

    set handler salv_refresh for all instances.

    go_alv->refresh( ).
        
    selections = go_alv->get_selections( ).
    selections->set_selection_mode(   if_salv_c_selection_mode=>cell  ). 
    
    go_alv->display( ).

  endmethod.
  
    method salv_refresh.
    check handler_check eq abap_false.

*    data: fcat type lvc_s_fcat.


    sender->get_frontend_fieldcatalog(
      importing
        et_fieldcatalog = fcat    " Field Catalog
    ).
    
    assign fcat[ fieldname = 'CARRNAME' ] to field-symbol(<fcat>).
    if sy-subrc eq 0.
      <fcat>-edit = abap_true.
    endif.

    sender->set_frontend_fieldcatalog( it_fieldcatalog = fcat ).
    
        sender->register_edit_event(
      exporting
        i_event_id = sender->mc_evt_modified    " Event ID
*      exceptions
*        error      = 1
*        others     = 2
    ).
    if sy-subrc <> 0.
*     message id sy-msgid type sy-msgty number sy-msgno
*                with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    endif.
    
    sender->set_ready_for_input(
        i_ready_for_input = 1
    ).

    handler_check = abap_true.
    
    endmethod.

  endclass.
