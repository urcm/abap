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

