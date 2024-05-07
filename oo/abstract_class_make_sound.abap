class lcl_animal definition abstract.
  public section.
    methods: make_sound abstract returning value(rv_sound) type string.
endclass.

class lcl_dog definition inheriting from lcl_animal.
  public section.
    methods: make_sound redefinition.
endclass.

class lcl_cat definition inheriting from lcl_animal.
  public section.
    methods: make_sound redefinition.
endclass.

class lcl_dog implementation.
  method make_sound.
    rv_sound = 'Wuff!'.
  endmethod.
endclass.

class lcl_cat implementation.
  method make_sound.
    rv_sound = 'Miau!'.
  endmethod.
endclass.

class lcl_animal_factory definition abstract.
  public section.
    methods: create_animal abstract returning value(ro_animal) type ref to lcl_animal.
endclass.

class lcl_dog_factory definition inheriting from lcl_animal_factory.
  public section.
    methods: create_animal redefinition.
endclass.

class lcl_cat_factory definition inheriting from lcl_animal_factory.
  public section.
    methods: create_animal redefinition.
endclass.

class lcl_dog_factory implementation.
  method create_animal.
    create object ro_animal type lcl_dog.
  endmethod.
endclass.

class lcl_cat_factory implementation.
  method create_animal.
    create object ro_animal type lcl_cat.
  endmethod.
endclass.

start-of-selection.
  data: lo_animal_factory type ref to lcl_animal_factory,
        lo_animal         type ref to lcl_animal.

  lo_animal_factory = new lcl_dog_factory( ).
  lo_animal = lo_animal_factory->create_animal( ).
  write: / 'Der Hund macht Geräusche:', lo_animal->make_sound( ).

  lo_animal_factory = new lcl_cat_factory( ).
  lo_animal = lo_animal_factory->create_animal( ).
  write: / 'Die Katze macht Geräusche:', lo_animal->make_sound( ).
