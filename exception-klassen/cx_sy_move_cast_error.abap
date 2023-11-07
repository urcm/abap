parameters pa_class type string default 'CL_ABAP_TYPEDESCR'.

data: go_type  type ref to cl_abap_typedescr,
      go_class type ref to cl_abap_classdescr.

go_type = cl_abap_typedescr=>describe_by_name( pa_class ).

case go_type->kind.
  when 'C'.
    try.
        go_class ?= go_type.

        loop at go_class->attributes assigning field-symbol(<fs_att>) from 1 to 10.
          write: /10 <fs_att>-name, <fs_att>-type_kind.
        endloop.

        uline.

        loop at go_class->methods assigning field-symbol(<fs_meth>).
          write: /10 <fs_meth>-name.
        endloop.

      catch cx_sy_move_cast_error into data(go_error).
        message go_error->get_text( ) type 'I'.
    endtry.
  when others.
endcase.
