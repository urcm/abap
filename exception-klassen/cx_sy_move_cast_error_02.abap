class lcl_animal definition.
  public section.
    methods: make_sound.
endclass.

class lcl_animal implementation.
  method make_sound.
    write: / 'Tier macht Geräusche'.
  endmethod.
endclass.

class lcl_cat definition inheriting from lcl_animal.
  public section.
    methods: make_sound redefinition.
endclass.

class lcl_cat implementation.
  method make_sound.
    write: / 'Katze miaut'.
  endmethod.
endclass.

class lcl_dog definition inheriting from lcl_animal.
  public section.
    methods: make_sound redefinition.
endclass.

class lcl_dog implementation.
  method make_sound.
    write: / 'Hund bellt'.
  endmethod.
endclass.

start-of-selection.

  data: lo_animal type ref to lcl_animal.

  create object lo_animal type lcl_cat.
  call method lo_animal->make_sound( ).

  create object lo_animal type lcl_dog.
  call method lo_animal->make_sound( ).

  try.

      data(lo_cat) = new lcl_cat( ).

      lo_cat ?= lo_animal.
      lo_cat->make_sound( ).

    catch cx_sy_move_cast_error into data(lx_error).
      write: / 'Fehler beim Aufrufen der Methode make_sound:', lx_error->get_text( ).
  endtry.
