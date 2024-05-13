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
    write: / 'Meow'.
  endmethod.
endclass.


class lcl_dog definition inheriting from lcl_animal.
  public section.
    methods make_sound redefinition.
endclass.

class lcl_dog implementation.
  method make_sound.
    write: / 'Woof'.
  endmethod.
endclass.


class lcl_singleton definition.
  public section.
    class-methods get_instance returning value(ro_instance) type ref to lcl_singleton.
    methods: get_cat returning value(ro_cat) type ref to lcl_cat,
             get_dog returning value(ro_dog) type ref to lcl_dog.

  private section.
    class-data: mo_instance type ref to lcl_singleton.
endclass.

class lcl_singleton implementation.
  method get_instance.
    if mo_instance is initial.
      create object mo_instance.
    endif.
    ro_instance = mo_instance.
  endmethod.

  method get_cat.
    create object ro_cat.
  endmethod.

  method get_dog.
    create object ro_dog.
  endmethod.
endclass.


  lo_animal->make_sound( ).
