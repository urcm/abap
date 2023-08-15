parameters : pa_fname type zfirstname,             
             pa_lname type zlastname,             
             pa_activ type zassets,             
             pa_liabs type zliabilities.


class lcl_dataelm definition.  
   public section.    
    methods: constructor importing iv_fname type zfirstname                                   
                                   iv_lname type zlastname                                  
                                   iv_activ type zassets                                   
                                   iv_liabs type  zliabilities.    

    methods: calculate returning value(rv_status) type char50.  

   private section.    
    data: mv_firstname   type zfirstname,          
         mv_lastname    type zlastname,          
         mv_activ       type zassets,          
         mv_liabilities type zliabilities,         
         mv_status      type char10 value '  Status: '.


endclass.

class lcl_dataelm implementation.  
	method constructor.    
		mv_firstname = iv_fname.    
		mv_lastname = iv_lname.    
		mv_activ = iv_activ.    
		mv_liabilities = iv_liabs.  
	endmethod.  

	method calculate.    
		data(lv_result) = mv_activ - mv_liabilities.    
		rv_status = mv_firstname && ` `  && mv_lastname && `  `  && me->mv_status && lv_result.  
	endmethod.
endclass.

start-of-selection.  
data(lo_per) = new lcl_dataelm( iv_fname = pa_fname
                                iv_lname = pa_lname
				iv_activ = pa_activ
				iv_liabs = pa_liabs  ).  



