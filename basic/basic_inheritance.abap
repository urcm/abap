class lcl_animal definition.
  public section.
    methods: make_sound.
endclass.

class lcl_dog definition inheriting from lcl_animal.
  public section.
    methods: make_sound redefinition.
endclass.

class lcl_cat definition inheriting from lcl_animal.
  public section.
    methods: make_sound redefinition.
endclass.

class lcl_animal implementation.
  method make_sound.
    write: 'Tier macht ein Geräusch'.
  endmethod.
endclass.

class lcl_dog implementation.
  method make_sound.
    write:/ 'Hund bellt'.
  endmethod.
endclass.

class lcl_cat implementation.
  method make_sound.
    write:/ 'KAtze miault'.
  endmethod.
endclass.

start-of-selection.

  data: lo_animal type ref to lcl_animal.

  create object lo_animal type lcl_dog.
  call method lo_animal->make_sound.

  create object lo_animal type lcl_cat.
  call method lo_animal->make_sound.
