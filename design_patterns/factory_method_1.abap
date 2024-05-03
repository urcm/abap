class lcl_animal definition.
  public section.
    methods: make_sound.
endclass.

class lcl_animal implementation.
  method make_sound.
    write: 'Tier macht ein Geräusch'.
  endmethod.
endclass.

class lcl_dog definition inheriting from lcl_animal.
  public section.
    methods: make_sound redefinition.
endclass.

class lcl_cat definition inheriting from lcl_animal.
  public section.
    methods: make_sound redefinition.
endclass.

class lcl_bird definition inheriting from lcl_animal. 
  public section.
    methods: make_sound redefinition.
endclass.

class lcl_animalfactory definition.
  public section.
    class-methods: create_animal importing type_name         type string
                                 returning value(animal_ref) type ref to lcl_animal.
endclass.

class lcl_animalfactory implementation.
  method create_animal.
    case type_name.
      when 'DOG'.
        create object animal_ref type lcl_dog.
      when 'CAT'.
        create object animal_ref type lcl_cat.
      when 'BIRD'. " Fall für Vogel hinzugefügt
        create object animal_ref type lcl_bird.
      when others.
        raise exception type cx_sy_create_object_error.
    endcase.
  endmethod.
endclass.

class lcl_dog implementation.
  method make_sound.
    write:/ 'Hund bellt'.
  endmethod.
endclass.

class lcl_cat implementation.
  method make_sound.
    write:/ 'Katze miault'.
  endmethod.
endclass.

class lcl_bird implementation.
  method make_sound.
    write:/ 'Vogel singt'. 
  endmethod.
endclass.

start-of-selection.

  data: lo_animal_factory type ref to lcl_animalfactory,
        lo_animal         type ref to lcl_animal.

  create object lo_animal_factory.

  " Erstelle Tierobjekte mithilfe der Factory Methode
  lo_animal = lo_animal_factory->create_animal( 'DOG' ).
  call method lo_animal->make_sound.

  lo_animal = lo_animal_factory->create_animal( 'CAT' ).
  call method lo_animal->make_sound.

  lo_animal = lo_animal_factory->create_animal( 'BIRD' ). 
  call method lo_animal->make_sound.
