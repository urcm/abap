*cx_root   
*
*global public interface  if_message    
*global public interface  if_serializable_object    
*public instance constructor  constructor    
*public method  get_longtext    
*public instance method  get_source_position    
*public method  get_text    
*public static constant  cx_root  type sotr_conc value '16AA9A3937A9BB56E10000000A11447B'  
*public instance read only attribute  is_resumable  type abap_bool read-only  
*public instance read only attribute  kernel_errid  type s380errid read-only  
*public instance read only attribute  previous  type ref to cx_root read-only  
*public instance read only attribute  textid  type sotr_conc read-only  
*
*
*Documentation
*
*Abstract Superclass for All Global Exceptions
*
*Components
*
*
*cx_root   Exception ID: Value for Attribute TEXTID 
*is_resumable   Flag, Whether RESUME Can Be Used in the Exception Handler 
*kernel_errid   Internal Name of Exception, if Triggered from Kernel 
*previous   Exception Mapped to the Current Exception 
*textid   Key for Access to Message Text 


data: cx_error    type ref to cx_root,
      lv_longtext type string.

data: lv_num1   type i value 10,
      lv_num2   type i value 0,
      lv_result type i.

try.
    lv_result = lv_num1 / lv_num2.
  catch cx_sy_zerodivide into cx_error.
    lv_longtext  = cx_error->get_longtext( ).
    message lv_longtext  type 'I'.
endtry.

