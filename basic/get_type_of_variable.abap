TYPES: my_type TYPE i.
DATA: my_data TYPE my_type,
      descr_ref TYPE ref to cl_abap_typedescr.

START-OF-SELECTION.
  descr_ref = cl_abap_typedescr=>describe_by_data( my_data ).
  WRITE: / descr_ref->get_type( ).
