
tables: scarr.

types: begin of ty_scarr,
         carrid   type   s_carr_id,
         carrname type  s_carrname,
         currcode type  s_currcode,
         url      type  s_carrurl,
       end of ty_scarr.

data: gt_scarr type table of ty_scarr.
*data: gt_scarr type ty_scarr occurs 0.
data : go_file type string.
data : fl_file type rlgrap-filename.
