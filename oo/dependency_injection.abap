interface zif_animal.
  methods: make_sound returning value(result) type string.
endinterface.

class lcl_cat definition.
  public section.
    interfaces: zif_animal.
endclass.

class lcl_cat implementation.
  method zif_animal~make_sound.
    result = 'Miau!'.
  endmethod.
endclass.

class lcl_dog definition.
  public section.
    interfaces: zif_animal.
endclass.

class lcl_dog implementation.
  method zif_animal~make_sound.
    result = 'Wuff!'.
  endmethod.
endclass.

class lcl_animal_sound definition.
  public section.
    methods: play_sound importing io_animal type ref to zif_animal.
endclass.

class lcl_animal_sound implementation.
  method play_sound.
    write: / io_animal->make_sound( ).
  endmethod.
endclass.

start-of-selection.
  data: lo_sound  type ref to lcl_animal_sound,
        lo_animal type ref to zif_animal.

  create object lo_sound.

  create object lo_animal type lcl_cat.
  lo_sound->play_sound( io_animal = lo_animal ).

  create object lo_animal type lcl_dog.
  lo_sound->play_sound( io_animal = lo_animal ).
