
class obj_search definition.
  public section.
    methods: init.
    types: begin of flight,
             carrid   type spfli-carrid,
             connid   type spfli-connid,
             cityfrom type spfli-cityfrom,
             cityto   type spfli-cityto,
             airpfrom type spfli-airpfrom,
           end of flight.

    data: ta_sflight type standard table of flight.

    methods:
      get_name
        returning value(rv_name) type string.

  private section.
    methods: get_data.
endclass.
