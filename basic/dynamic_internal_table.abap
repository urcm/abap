parameters pa_tab type dd02l-tabname default 'SPFLI'.
parameters pa_feld type string default 'CARRID CONNID CITYFROM CITYTO'.
parameters pa_whe type string default `CITYFROM = 'FRANKFURT' and CITYTO = 'BERLIN'`.

data gr_tab type ref to data.
field-symbols <fs_tab> type any table.

create data gr_tab type table of (pa_tab).
assign gr_tab->* to <fs_tab>.

