
class cl_nested definition.
  public section.
    methods constructor.


    data: begin of mara_db,
            begin of mara_usr,
              ernam type mara-ernam,
              aenam type mara-aenam,
              laeda type mara-laeda,
            end of mara_usr,
            begin of mara_date,
              matnr type mara-matnr,
              ersda type mara-ersda,
              aenam type mara-aenam,
            end of mara_date,
            begin of mara_other,
              mtart type mara-mtart,
              matkl type mara-matkl,
            end of mara_other,
          end of mara_db.
          

    class-methods main.

endclass.
