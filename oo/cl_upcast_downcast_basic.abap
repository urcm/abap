* Oberklasse

class lcl_space definition.
  public section.
    methods constructor.
    methods display_info.

  protected section.
    data mv_info type string.
  private section.

endclass

class lcl_space implementation.
  method constructor.
    mv_info = 'There are a total of 8 planets in our solar system.'.
    uline.
  endmethod.
  method display_info.
    write :/ mv_info.
  endmethod.
endclass.

*******************************************

* Unterklasse

class lcl_world definition inheriting from lcl_space.
  public section.
    methods display_info redefinition.
    methods display_detail.
  protected section.
  private section.
endclass.

class lcl_world implementation.
  method display_info.
*    super->display_info( ).
    write :/ 'World: It ranks third in terms of proximity to the Sun. It has a satellite called the Moon.'.
  endmethod.
  method display_detail.
    write :/ 'It is the only planet in the solar system known to have life.'.
    uline.
  endmethod.
endclass.

class lcl_mercury definition inheriting from lcl_space.
  public section.
    methods display_info redefinition.
    methods display_detail.
  protected section.
  private section.
endclass.

class lcl_mercury implementation.
  method display_info.
    uline.
*    super->display_info( ).
    write :/ 'Mercury: It is the smallest and closest planet to the Sun. It has no satellites or rings.'.
  endmethod.
  method display_detail.
    write :/ 'Its mass is one twentieth of the mass of the Earth.'.
  endmethod.
endclass.


start-of-selection.
  data go_space type ref to lcl_space.
  create object go_space.
  go_space->display_info( ).

  data(go_world) = new lcl_world( ).
  go_world->display_info( ).
  go_world->display_detail( ).

