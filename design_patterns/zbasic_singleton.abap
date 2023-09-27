class lcl_singleton definition.
  public section.
    class-methods get_instance returning value(ro_instance) type ref to lcl_singleton.

  protected section.
  private section.
    class-data mo_instance type ref to lcl_singleton.
endclass.

class lcl_singleton implementation.
  method get_instance.
    if mo_instance is not bound.
      create object mo_instance.
    endif.
    ro_instance = mo_instance.
  endmethod.
endclass.

