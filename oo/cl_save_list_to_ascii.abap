
class export_text definition.
  public section.
    types: begin of t_sflight,
             carrid    type sflight-carrid,
             fldate    type sflight-fldate,
             price     type sflight-price,
             planetype type sflight-planetype,
             carrname  type scarr-carrname,
           end of t_sflight.

    data: its_sflight type standard table of t_sflight.
    data: it_sflight type standard table of t_sflight.

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

    select a~carrid a~fldate a~price a~planetype b~carrname
          from sflight as a
          inner join scarr as b
          on a~carrid = b~carrid
                 into table it_sflight
         up to 100 rows.

    move-corresponding it_sflight to its_sflight keeping target lines.

    display( ).
    convert_asci( ).
    down_txt( ).
  endmethod.
  
  method convert_asci.
    call function 'LIST_TO_ASCI'
      exporting
        list_index = 0
      tables
        listasci   = it_report.
  endmethod.

  method down_txt.
    call function 'WS_DOWNLOAD'
      exporting
        filename = 'C:\temp\report.txt'
        filetype = 'ASC'
      tables
        data_tab = it_report.

  endmethod.

  method display.
    loop at its_sflight assigning field-symbol(<fs_sflight>).
      write:/ sy-vline,
              <fs_sflight>-carrid, sy-vline,
              <fs_sflight>-fldate, sy-vline,
              <fs_sflight>-price, sy-vline,
              <fs_sflight>-planetype, sy-vline,
              <fs_sflight>-carrname, sy-vline.
    endloop.
  endmethod.
endclass.

start-of-selection.
  data(sw_sflight) = new export_text( ).
  sw_sflight->get_data( ).
