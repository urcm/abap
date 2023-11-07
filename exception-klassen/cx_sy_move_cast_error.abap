parameters pa_class type string default 'CL_ABAP_TYPEDESCR'.

data: go_type  type ref to cl_abap_typedescr,
      go_class type ref to cl_abap_classdescr.

go_type = cl_abap_typedescr=>describe_by_name( pa_class ).

case go_type->kind.
  when 'C'.

  when others.
endcase.
