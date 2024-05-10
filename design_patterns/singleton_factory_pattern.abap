class lcl_animal definition abstract.
  public section.
    methods make_sound abstract returning value(rv_sound) type string.
endclass.

class lcl_dog definition inheriting from lcl_animal.
  public section.
    methods make_sound redefinition.
endclass.

class lcl_cat definition inheriting from lcl_animal.
  public section.
    methods make_sound redefinition.
endclass.

class lcl_dog implementation.
  method make_sound.
    rv_sound = 'Woof!'.
  endmethod.
endclass.

class lcl_cat implementation.
  method make_sound.
    rv_sound = 'Meow!'.
  endmethod.
endclass.

class lcl_animal_singleton definition.
  public section.
    class-methods get_instance importing iv_type              type string
                               returning value(re_animal) type ref to lcl_animal.

  private section.
    class-data: mo_instance type ref to lcl_animal.
endclass.

class lcl_animal_singleton implementation.
  method get_instance.
    if mo_instance is initial.
      case iv_type.
        when 'DOG'.
          create object mo_instance type lcl_dog.
        when 'CAT'.
          create object mo_instance type lcl_cat.
        when others.
          raise exception type cx_sy_create_object_error.
      endcase.
    endif.

    re_animal = mo_instance.

  endmethod.
endclass.

start-of-selection.
  data: dog type ref to lcl_animal,
        cat type ref to lcl_animal.

  dog = lcl_animal_singleton=>get_instance( 'DOG' ).
  write: / 'Hund bellt:', dog->make_sound( ).

  cat = lcl_animal_singleton=>get_instance( 'CAT' ).
  write: / 'Katze miaut:', cat->make_sound( ).
