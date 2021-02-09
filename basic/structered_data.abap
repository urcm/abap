
start-of-selection.
  perform define_str.
*&---------------------------------------------------------------------*
*&      Form  DEFINE_STR
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form define_str .
  types: begin of mara_usr,
           ernam type mara-ernam,
           aenam type mara-aenam,
           laeda type mara-laeda,
         end of mara_usr.

  types: begin of mara_date,
           matnr type mara-matnr,
           ersda type mara-ersda,
           aenam type mara-aenam,
         end of mara_data.

  types: begin of mara_info,
           usr_info type mara_usr,
           usr_date type mara_date,
           usr_nbr  type i,
         end of mara_info.
endform.
