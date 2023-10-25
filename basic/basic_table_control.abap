*&---------------------------------------------------------------------*
*& Report ZBSP_TABLECONTROL_BASIC
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zbsp_tablecontrol_basic.

tables sdyn_conn.

data ok_code type sy-ucomm.

data gs_spfli type spfli.

data: begin of gs_sflight.
        include structure sflight.
        data: mark,
      end of gs_sflight.
