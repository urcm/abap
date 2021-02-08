
class cl_nested definition.
  public section.
    methods constructor.

    types:  begin of mara_db,
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

    data: company_tab type standard table of mara_db.

    methods main.

endclass.

class cl_nested implementation.
  method constructor.
    company_tab = value #(
( mara_usr = value #( ernam  = 'James'
                      aenam  = 'Bond'
                      laeda  = '01.10.1976'
                      )
mara_date = value #(  matnr  = '007'
                      ersda  = '20160821'
                      aenam  = 'Bond'
)
mara_other = value #( mtart  = 'MI7'
                      matkl  = '07'
            ) )
            ).
  endmethod.
  method main.
    loop at company_tab assigning field-symbol(<fs_s>).
      write :/ <fs_s>-mara_usr.
      skip.
      write :/ <fs_s>-mara_date.
      skip.
      write :/ <fs_s>-mara_date-ersda.
    endloop.
  endmethod.
endclass.


start-of-selection.
data(lo_data) = new cl_nested( ).
lo_data->main( ).
