data: gd_ucomm type sy-ucomm.

selection-screen: begin of block e_form with frame title ev_form.
parameters: p_carrid type spfli-carrid
                            as listbox visible length 10
                            user-command upd,
            p_uname  type uname.
selection-screen: end of block e_form.

at selection-screen.
  gd_ucomm = sy-ucomm.
  if sy-ucomm eq 'UPD'.
    "show a message.
  endif.

at selection-screen output.
  case gd_ucomm.
    when 'UPD'.
      if p_carrid = 'AF'.
        loop at screen.
          if screen-name cs 'P_UNAME'.
            screen-active = 0.
*           screen-input = 0.
            modify screen.
          endif.
        endloop.
      else.
        message 'Just for Air France second form makes unvisible' type 'I' display like 'E'.
      endif.
  endcase.

initialization.
  %_p_carrid_%_app_%-text = 'Airway Name'.
  %_p_uname_%_app_%-text = 'Airway Code'.
