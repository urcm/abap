
class lcl_animal definition abstract.
  public section.
    methods make_sound abstract.
endclass.

class lcl_cat definition inheriting from lcl_animal.
  public section.
    methods make_sound redefinition.
endclass.

class lcl_cat implementation.
  method make_sound.
    write: / 'Miau!'.
  endmethod.
endclass.

class lcl_dog definition inheriting from lcl_animal.
  public section.
    methods make_sound redefinition.
endclass.

class lcl_dog implementation.
  method make_sound.
    write: / 'Wuff!'.
  endmethod.
endclass.

start-of-selection.
  data: lo_animal type ref to lcl_animal.

  create object lo_animal type lcl_cat.
  lo_animal->make_sound( ).

  create object lo_animal type lcl_dog.
  lo_animal->make_sound( ).
