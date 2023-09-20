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




