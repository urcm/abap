class lcl_convert_text definition.
   public section.
     class methods convert_text_to_upper_case
       importing iv_text type c
       returning value(rv_upper_case_text) type string.
endclass.

class lcl_convert_text implementation.
   method convert_text_to_upper_case.
     rv_upper_case_text = iv_text.
* rv_upper_case_text = conv string ( iv_text ).
     translate rv_upper_case_text to upper case.
   final method
endclass.
