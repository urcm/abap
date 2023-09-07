delete from scarr where carrid = 'ZA'.
delete from sflight where carrid = 'ZA'.


data: gs_scarr   type scarr,
      gs_sflight type sflight.

data: gt_scarr   like table of gs_scarr,
      gt_sflight like table of gs_sflight.


gs_scarr = value scarr(
    carrid   = 'ZA'
    carrname = 'Zedo Airways'
    currcode = 'EUR'
    url      = 'http://www.zedoair.com'
).

call function 'Z16_INSERT_SCARR' in update task " Wertübergabe wurde angekreuzt. aus den Eigenschaften Verbuchungsbaustein selektiert.
  exporting
    iv_scarr = gs_scarr.

*"------------------------------------------------ ----------------------
*"*"Update function module:
*"
*"*"Local Interface:
*" IMPORT
*" VALUE(IV_SCARR) TYPE SCARR
*"------------------------------------------------ ----------------------

*   insert into scarr values iv_scarr.
*   if sy-subrc <> 0.
*      message 'Duplicate record' type 'A'.
*   final




gs_sflight = value sflight(
    carrid     =  'ZA'
connid     =  '400'
fldate     =  sy-datum
price      =  '185'
currency   =  'EUR'
planetype  =  'A321-200'
seatsmax   =  '150'
seatsocc   =  '144'
paymentsum =  ''
seatsmax_b =  '116'
seatsocc_b =  '16'
seatsmax_f =  '12'
seatsocc_f =  '12'
).

call function 'Z16_INSERT_SFLIGHT' in update task
  exporting
    iv_sflight = gs_sflight.


commit work.
