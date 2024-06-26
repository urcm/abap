
interface zif_observer.
  methods: update_status importing status type string.
endinterface.

class lcl_animal definition.
  public section.
    data: lv_status type string.
    methods: attach_observer importing observer type ref to zif_observer,
      detach_observer importing observer type ref to zif_observer,
      notify_observers,
      feed.
  private section.
    data: lt_observers type table of ref to zif_observer.
endclass.

class lcl_animal implementation.
  method attach_observer.
    append observer to lt_observers.
  endmethod.

  method detach_observer.
    delete lt_observers where table_line = observer.
  endmethod.

  method notify_observers.
    loop at lt_observers into data(observer).
      observer->update_status( status = lv_status ).
    endloop.
  endmethod.

  method feed.
    lv_status = 'satt'.
    notify_observers( ).
  endmethod.
endclass.

class lcl_cat definition inheriting from lcl_animal.
  public section.
    interfaces: zif_observer.
endclass.

class lcl_cat implementation.
  method zif_observer~update_status.
    write:/ 'Die Katze hat Hunger.'.
    if status = 'Hunger'.
      write:/ 'Die Katze hat Hunger.'.
    else.
      write:/ 'Die Katze ist satt.'.
    endif.
  endmethod.
endclass.

class lcl_dog definition inheriting from lcl_animal.
  public section.
    interfaces: zif_observer.
endclass.

class lcl_dog implementation.
  method zif_observer~update_status.
    write:/ 'Der Hund hat Hunger.'.
    if status = 'Hunger'.
      write:/ 'Der Hund hat Hunger.'.
    else.
      write:/ 'Der Hund ist satt.'.
    endif.
  endmethod.
endclass.


start-of-selection.
  data(lo_cat) = new lcl_cat( ).
  data(lo_dog) = new lcl_dog( ).

  lo_cat->attach_observer( observer = lo_cat ).
  lo_dog->attach_observer( observer = lo_dog ).

  lo_cat->feed( ).
  lo_dog->feed( ).
