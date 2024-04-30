class lcl_transformation definition.
  public section.
    methods: run_transformation.
endclass.

class lcl_transformation implementation.
  method run_transformation.
    try.
        data: lv_source type string value 'Source',
              lv_style  type string value 'Style',
              lv_result type string.

        call transformation id
          source xml lv_source
          result xml lv_result.

      catch cx_transformation_error into data(lx_error).
        message lx_error->get_text( ) type 'I'.
*        write 'Fehler beim Transformieren: ' && lx_error->get_text( ).
    endtry.
  endmethod.
endclass.

start-of-selection.
  data(lo_transform) = new lcl_transformation(  ).
  lo_transform->run_transformation( ).
