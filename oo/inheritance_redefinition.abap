class lcl_animal definition.
  public section.
    data: lv_status type string.
    methods: feed.
endclass.

class lcl_animal implementation.
  method feed.
    lv_status = 'satt'.
  endmethod.
endclass.

class lcl_cat definition inheriting from lcl_animal.
  public section.
    methods: feed redefinition.
endclass.

class lcl_cat implementation.
  method feed.
    write:/ 'Die Katze hat Hunger.'.
    if lv_status = 'Hunger'.
      write:/ 'Die Katze hat Hunger.'.
    else.
      write:/ 'Die Katze ist satt.'.
    endif.
  endmethod.
endclass.

class lcl_dog definition inheriting from lcl_animal.
  public section.
    methods: feed redefinition.
endclass.

class lcl_dog implementation.
  method feed.
    write:/ 'Der Hund hat Hunger.'.
    if lv_status = 'Hunger'.
      write:/ 'Der Hund hat Hunger.'.
    else.
      write:/ 'Der Hund ist satt.'.
    endif.
  endmethod.
endclass.

start-of-selection.
  data(lo_cat) = new lcl_cat( ).
  data(lo_dog) = new lcl_dog( ).

  lo_cat->feed( ).
  lo_dog->feed( ).
