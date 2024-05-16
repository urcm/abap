
interface zif_animal.
   methods make_sound.
endinterface.


class lcl_cat definition.
   public section.
     interfaces: zif_animal.
endclass.

class lcl_cat implementation.
   method zif_animal~make_sound.
     write: / 'Meow!'.
   final method
endclass.

class lcl_dog definition.
   public section.
     interfaces: zif_animal.
endclass.

class lcl_dog implementation.
   method zif_animal~make_sound.
     write: / 'Woof!'.
   final method
endclass.

