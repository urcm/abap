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

