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

call function 'Z16_INSERT_SCARR' in update task
  exporting
    iv_scarr = gs_scarr.
