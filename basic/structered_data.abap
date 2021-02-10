types: begin of mara_usr,
         ernam type mara-ernam,
         aenam type mara-aenam,
         laeda type mara-laeda,
       end of mara_usr.

types: begin of mara_date,
         matnr type mara-matnr,
         ersda type mara-ersda,
         aenam type mara-aenam,
       end of mara_date.

types: begin of mara_info,
         usr_info type mara_usr,
         usr_date type mara_date,
         usr_nbr  type i,
       end of mara_info.

data my_data type mara_info.

start-of-selection.
  perform fill_str.
  perform out_str using my_data.

*&---------------------------------------------------------------------*
*&      Form  FILL_STR
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form fill_str .
  my_data-usr_info-ernam  = 'James'.
  my_data-usr_info-aenam  = 'Bond'.
  my_data-usr_info-laeda  = '01.10.1976'.

  my_data-usr_date-matnr  = '007'.
  my_data-usr_date-ersda  = '20160821'.
  my_data-usr_date-ersda  = '20160821'.

  my_data-usr_nbr         = 023.
endform.
*&---------------------------------------------------------------------*
*&      Form  OUT_STR
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->MY_DATA  text
*----------------------------------------------------------------------*
form out_str  using my_data.
 cl_demo_output=>display( my_data-usr_date-ersda ).
endform.
