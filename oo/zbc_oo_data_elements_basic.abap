parameters : pa_fname type zfirstname,             
             pa_lname type zlastname,             
             pa_activ type zassets,             
             pa_liabs type zliabilities.


class lcl_dataelm definition.  
   public section.    
    methods: constructor importing iv_fname type zfirstname16                                   
                                   iv_lname type zlastname16                                   
                                   iv_activ type zassets16                                   
                                   iv_liabs type  zliabilities16.    

    methods: calculate returning value(rv_status) type char50.  

   private section.    
    data: mv_firstname   type zfirstname16,          
         mv_lastname    type zlastname16,          
         mv_activ       type zassets16,          
         mv_liabilities type zliabilities16,         
         mv_status      type char10 value '  Status: '.


endclass.



