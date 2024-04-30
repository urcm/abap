class lcl_animal definition.
  public section.
    methods: make_sound.
endclass.

class lcl_animal implementation.
  method make_sound.
    write: 'Das Tier macht ein Geräusch.'.
  endmethod.
endclass.
class lcl_cat definition inheriting from lcl_animal.
  public section.
    methods: make_sound redefinition.
endclass.
class lcl_cat implementation.
  method make_sound.
    write: 'Katze miaut.'.
  endmethod.
endclass.

start-of-selection.
  try.
      data: lo_cat    type ref to lcl_cat,
            lo_animal type ref to lcl_animal.
      create object lo_cat.
      cast lcl_animal( lo_animal )->make_sound( ).
    catch cx_sy_ref_is_initial into data(gv_error). " Dereferencing of the NULL reference
      message gv_error->get_text( ) type 'I'.
  endtry.
