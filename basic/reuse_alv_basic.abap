
types: begin of gty_scarr,
         carrid   type s_carr_id,
         carrname type  s_carrname,
         currcode type  s_currcode,
         url      type s_carrurl,
       end of gty_scarr.


data: gt_scarr        type table of gty_scarr,
      gt_fieldcatalog type slis_t_fieldcat_alv,
      gs_fieldcatalog type slis_fieldcat_alv,
      gs_layout       type slis_layout_alv.
