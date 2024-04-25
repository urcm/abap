class lcl_animal definition.
  public section.
    methods: make_sound.
endclass.

class lcl_animal implementation.
  method make_sound.
    write: / 'Tier macht Geräusche'.
  endmethod.
endclass.

class lcl_cat definition inheriting from lcl_animal.
  public section.
    methods: make_sound redefinition.
endclass.

class lcl_cat implementation.
  method make_sound.
    write: / 'Katze miaut'.
  endmethod.
endclass.

class lcl_dog definition inheriting from lcl_animal.
  public section.
    methods: make_sound redefinition.
endclass.

class lcl_dog implementation.
  method make_sound.
    write: / 'Hund bellt'.
  endmethod.
endclass.

