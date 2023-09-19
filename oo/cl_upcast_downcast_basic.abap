class lcl_space definition.
  public section.
    methods constructor.
    methods display_info.

  protected section.
    data mv_info type string.
  private section.

endclass.

class lcl_space implementation.
  method constructor.
    mv_info = 'There are a total of 8 planets in our solar system.'.
    uline.
  endmethod.
  method display_info.
    write :/ mv_info.
  endmethod.
endclass.
