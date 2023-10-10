types: begin of ts_sflight.
         include type sflight.
         types: light type c length 1,
       end of ts_sflight.

data: gt_sflight type standard table of ts_sflight.
data: gt_fieldcat type lvc_t_fcat,
      gs_fieldcat type lvc_s_fcat.

data gs_layout type lvc_s_layo.


data: go_container type ref to cl_gui_custom_container,
      go_grid      type ref to cl_gui_alv_grid.

start-of-selection.

  select * from sflight into corresponding fields of table gt_sflight.


  loop at gt_sflight assigning field-symbol(<fs_sflight>).
    if <fs_sflight>-seatsocc = 0.
      <fs_sflight>-light = '1'.
    elseif <fs_sflight>-seatsocc < 50.
      <fs_sflight>-light = '2'.
    else.
      <fs_sflight>-light = '3'.
    endif.
    modify gt_sflight from <fs_sflight>.
    endloop.

if go_grid is initial.
    create object go_grid
      exporting
        i_parent          = cl_gui_container=>screen0                  " Parent-Container
      exceptions
        error_cntl_create = 1                " Fehler beim Erzeugen des Controls
        error_cntl_init   = 2                " Fehler beim Initialisieren des Controls
        error_cntl_link   = 3                " Fehler beim Linken des Controls
        error_dp_create   = 4                " Fehler beim Erzeugen des DataProvider Control
        others            = 5.

    gs_layout-zebra = 'X'.
    gs_layout-sel_mode = 'A'.
    gs_layout-totals_bef = 'X'.
    gs_layout-excp_fname = 'LIGHT'.
    gs_layout-excp_led = 'X'.

    call function 'LVC_FIELDCATALOG_MERGE'
      exporting
        i_structure_name = 'SFLIGHT'
      changing
        ct_fieldcat      = gt_fieldcat.

    gs_fieldcat-fieldname = 'LIGHT'.
    append gs_fieldcat to gt_fieldcat.
    clear gs_fieldcat.


    go_grid->set_table_for_first_display(
      exporting
*    i_buffer_active               =                  " Pufferung aktiv
*    i_bypassing_buffer            =                  " Puffer ausschalten
*    i_consistency_check           =                  " Starte Konsistenzverprobung für Schnittstellefehlererkennung
     i_structure_name              = 'SFLIGHT'                  " Strukturname der internen Ausgabetabelle
*    is_variant                    =                  " Anzeigevariante
*    i_save                        =                  " Anzeigevariante sichern
*    i_default                     = 'X'              " Defaultanzeigevariante
    is_layout                     =  gs_layout                " Layout
*    is_print                      =                  " Drucksteuerung
*    it_special_groups             =                  " Feldgruppen
*    it_toolbar_excluding          =                  " excludierte Toolbarstandardfunktionen
*    it_hyperlink                  =                  " Hyperlinks
*    it_alv_graphics               =                  " Tabelle von der Struktur DTC_S_TC
*    it_except_qinfo               =                  " Tabelle für die Exception Quickinfo
*    ir_salv_adapter               =                  " Interface ALV Adapter
      changing
      it_outtab                     = gt_sflight                 " Ausgabetabelle
    it_fieldcatalog               =   gt_fieldcat               " Feldkatalog
*    it_sort                       =                  " Sortierkriterien
*    it_filter                     =                  " Filterkriterien
      exceptions
        invalid_parameter_combination = 1                " Parameter falsch
        program_error                 = 2                " Programmfehler
        too_many_lines                = 3                " Zu viele Zeilen in eingabebereitem Grid.
        others                        = 4
    ).

endif.
