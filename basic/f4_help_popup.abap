types: begin of ty_scarr,
         carrid   type scarr-carrid,
         connid   type sflight-connid,
         carrname type scarr-carrname,
       end of ty_scarr.
       

selection-screen begin of block b1 with frame title title.

selection-screen begin of line.
selection-screen comment (20) lbl1.
parameters: p_carrid type scarr-carrid.
selection-screen end of line.

selection-screen end of block b1.
