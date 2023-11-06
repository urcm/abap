parameters pa_tab type dd02l-tabname default 'SPFLI'.
parameters pa_feld type string default 'CARRID CONNID CITYFROM CITYTO'.
parameters pa_whe type string default `CITYFROM = 'FRANKFURT' and CITYTO = 'BERLIN'`.

data gr_tab type ref to data.
field-symbols <fs_tab> type any table.

create data gr_tab type table of (pa_tab).
assign gr_tab->* to <fs_tab>.

select (pa_feld) from (pa_tab)
  into corresponding fields of table <fs_tab> where (pa_whe).

try.
    cl_salv_table=>factory(
*    exporting
*      list_display   = if_salv_c_bool_sap=>false " ALV wird im Listenmodus angezeigt
*      r_container    =                           " Abstracter Container fuer GUI Controls
*      container_name =
      importing
        r_salv_table   =  data(go_alv)                         " Basisklasse einfache ALV Tabellen
      changing
        t_table        = <fs_tab>
    ).
  catch cx_salv_msg into data(go_error). " ALV: Allg. Fehlerklasse  mit Meldung
    message go_error->get_text( ) type 'I'.
endtry.

go_alv->display( ).






