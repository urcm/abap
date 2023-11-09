
" Place the following minus sign in front of the number


*"------------------------------------------------ ----------------------
*"*"Local Interface:
*" CHANGING
*" VALUE(VALUE) TYPE CLIKE
*"------------------------------------------------ ----------------------


parameters pa_num type p decimals 2 default '-123.45'.
data: lv_result type c length 20.

write pa_num to lv_result.

call function 'CLOI_PUT_SIGN_IN_FRONT'
   changing
     value = lv_result.

write: / 'The result', lv_result.


replace '-' with ' ' into lv_result.
write: / 'The result without the minus sign', lv_result.
