class lcl_animal definition abstract.
  public section.
    methods: make_sound abstract returning value(rv_sound) type string.
endclass.

class lcl_dog definition inheriting from lcl_animal.
  public section.
    methods: make_sound redefinition.
endclass.

class lcl_dog implementation.
  method make_sound.
    rv_sound = 'Woof!'.
  endmethod.
endclass.

class lcl_cat definition inheriting from lcl_animal.
  public section.
    methods: make_sound redefinition.
endclass.

class lcl_cat implementation.
  method make_sound.
    rv_sound = 'Meow!'.
  endmethod.
endclass.

class lcl_fish definition inheriting from lcl_animal.
  public section.
    methods: make_sound redefinition.
endclass.

class lcl_fish implementation.
  method make_sound.
    rv_sound = 'Blub!'.
  endmethod.
endclass.

class lcl_abstract_factory definition abstract.
  public section.
    methods:
      create_flying_animal abstract returning value(ro_flying_animal) type ref to lcl_animal,
      create_walking_animal abstract returning value(ro_walking_animal) type ref to lcl_animal,
      create_swimming_animal abstract returning value(ro_swimming_animal) type ref to lcl_animal.
endclass.

class lcl_animal_factory definition inheriting from lcl_abstract_factory.
  public section.
    methods:
      create_flying_animal redefinition,
      create_walking_animal redefinition,
      create_swimming_animal redefinition.
endclass.

class lcl_animal_factory implementation.
  method create_flying_animal.
    create object ro_flying_animal type lcl_cat.
  endmethod.

  method create_walking_animal.
    create object ro_walking_animal type lcl_dog.
  endmethod.

  method create_swimming_animal.
    create object ro_swimming_animal type lcl_fish.
  endmethod.
endclass.

start-of-selection.
  data: lo_factory         type ref to lcl_abstract_factory,
        lo_flying_animal   type ref to lcl_animal,
        lo_walking_animal  type ref to lcl_animal,
        lo_swimming_animal type ref to lcl_animal.

  create object lo_factory type lcl_animal_factory.

  lo_flying_animal = lo_factory->create_flying_animal( ).
  lo_walking_animal = lo_factory->create_walking_animal( ).
  lo_swimming_animal = lo_factory->create_swimming_animal( ).

  write: / lo_flying_animal->make_sound( ),
         / lo_walking_animal->make_sound( ),
         / lo_swimming_animal->make_sound( ).


