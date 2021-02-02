selection-screen begin of block num_x with frame title text-001.
parameters: num_ent type decfloat34.
selection-screen end of block num_x.

class num_func definition.
  public section.
    class-methods: main importing value_x type decfloat34.
endclass.

class num_func implementation.
  method main.
    write :/ | abs: { abs( value_x ) } |.
    write :/ | sign: { sign( value_x ) } |.
    write :/ | ceil: { ceil( value_x ) } |.
    write :/ | floor: { floor( value_x ) } |.
    write :/ | trunc: { trunc( value_x ) } |.
    write :/ | frac: { frac( value_x ) } |.
  endmethod.
endclass.

start-of-selection.
  data(make_num) = new num_func( ).
  call method make_num->main exporting value_x = num_ent.
