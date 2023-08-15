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



