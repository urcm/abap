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


