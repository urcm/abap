
data: gd_fcurr  type tcurr-fcurr,
      gd_lcurr  type tcurr-tcurr,
      in_amount type i,
      result    like in_amount.

gd_fcurr = 'EUR'.
gd_lcurr = 'USD'.
in_amount = '3200.00'.

perform currency_conversion using gd_fcurr
                                  gd_lcurr
                            changing in_amount.

write :/  |{ in_amount } { gd_fcurr } =  { result } { gd_lcurr }| .


form currency_conversion  using    p_gd_fcurr
                                   p_gd_lcurr
                          changing p_amount.

  call function 'CONVERT_AMOUNT_TO_CURRENCY'
    exporting
      date             = sy-datum
      foreign_currency = p_gd_fcurr
      foreign_amount   = p_amount
      local_currency   = p_gd_lcurr
    importing
      local_amount     = result.

endform.
