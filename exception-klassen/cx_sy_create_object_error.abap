class zcl_animal definition.
  public section.
    methods: constructor importing iv_type type string
                         raising   cx_sy_create_object_error.
    methods: produce_animal returning value(rv_voice) type string.
  private section.
    data: lv_type type string.

endclass.

class zcl_animal implementation.
  method constructor.
    if iv_type ne 'dog'.
      raise exception type cx_sy_create_object_error.
    else.
      lv_type = iv_type.
    endif.
  endmethod.

  method produce_animal.
    case lv_type.
      when 'dog'.
        rv_voice = 'Haaw'.
    endcase.
  endmethod.
endclass.

data: lo_object type ref to zcl_animal.

start-of-selection.

  try.
      create object lo_object
        exporting
          iv_type = 'cat'.

    catch cx_sy_create_object_error into data(create_error).
      write: 'Ein Fehler ist beim Erstellen des Objekts aufgetreten: ', create_error->get_text( ).
  endtry.
