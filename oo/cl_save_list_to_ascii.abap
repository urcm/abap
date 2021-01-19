
tables: sflight.

class export_text definition.
  public section.
    types: begin of t_sflight,
             carrid    type sflight-carrid,
             fldate    type sflight-fldate,
             price     type sflight-price,
             planetype type sflight-planetype,
           end of t_sflight.

    data: its_sflight type standard table of t_sflight.

 methods: get_data.
 
  private section.
    types: begin of its_report,
             line(300),
           end of its_report.

    data: it_report type standard table of its_report.

    methods: display,
      convert_asci,
      down_txt.
endclass.


class export_text implementation.
  method get_data.

    select * from sflight
      into table @data(it_sflight)
                      up to 100 rows.

    move-corresponding it_sflight to its_sflight keeping target lines.


    display( ).
    convert_asci( ).
    down_txt( ).
  endmethod.
  endclass.
