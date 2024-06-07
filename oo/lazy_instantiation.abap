class lcl_animal definition abstract.
  public section.
    methods: make_sound abstract.
endclass.

class lcl_dog definition inheriting from lcl_animal.
  public section.
    methods: make_sound redefinition.
endclass.

class lcl_cat definition inheriting from lcl_animal.
  public section.
    methods: make_sound redefinition.
endclass.

class lcl_factory definition.
  public section.
    class-methods: get_instance importing iv_type            type string
                                returning value(ro_instance) type ref to lcl_animal.

  private section.
    class-data: mo_instance type ref to lcl_animal.
endclass.

class lcl_dog implementation.
  method make_sound.
    write:/ 'Woof!'.
  endmethod.
endclass.

class lcl_cat implementation.
  method make_sound.
    write:/ 'Meow!'.
  endmethod.
endclass.

class lcl_factory implementation.
  method get_instance.
    case iv_type.
      when 'DOG'.
        create object mo_instance type lcl_dog.
      when 'CAT'.
        create object mo_instance type lcl_cat.
      when others.
        raise exception type cx_sy_create_object_error.
    endcase.
    ro_instance = mo_instance.

  endmethod.
endclass.

