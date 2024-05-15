
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
    write: / 'Miau!'.
  endmethod.
endclass.

