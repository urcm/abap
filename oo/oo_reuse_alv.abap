
class reuse_alv definition.
  public section.
    methods constructor.

  private section.
    data: gt_scarr        type table of scarr,
          gt_fieldcatalog type slis_t_fieldcat_alv,
          gs_fieldcatalog type slis_fieldcat_alv.

    methods: get_data,
      set_fcat,
      set_alv.
endclass.

class reuse_alv implementation.
  method constructor.

    get_data( ).
    set_fcat( ).
    set_alv( ).

  endmethod.

  method get_data.

    select * up to 20 rows from scarr
      into table gt_scarr.

  endmethod.
