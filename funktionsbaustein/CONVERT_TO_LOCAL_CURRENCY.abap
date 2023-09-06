
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     VALUE(CLIENT) LIKE  SY-MANDT DEFAULT SY-MANDT
*"     VALUE(DATE) LIKE  SYST-DATUM
*"     VALUE(FOREIGN_AMOUNT)
*"     VALUE(FOREIGN_CURRENCY)
*"     VALUE(LOCAL_CURRENCY)
*"     VALUE(RATE) DEFAULT 0
*"     VALUE(TYPE_OF_RATE) DEFAULT 'M'
*"     VALUE(READ_TCURR) DEFAULT 'X'
*"  EXPORTING
*"     VALUE(EXCHANGE_RATE)
*"     VALUE(FOREIGN_FACTOR)
*"     VALUE(LOCAL_AMOUNT)
*"     VALUE(LOCAL_FACTOR)
*"     VALUE(EXCHANGE_RATEX)
*"     VALUE(FIXED_RATE)
*"     VALUE(DERIVED_RATE_TYPE) LIKE  TCURR-KURST
*"  EXCEPTIONS
*"      NO_RATE_FOUND
*"      OVERFLOW
*"      NO_FACTORS_FOUND
*"      NO_SPREAD_FOUND
*"      DERIVED_2_TIMES
*"----------------------------------------------------------------------


parameters: pa_amnt type vbap-netwr,
            pa_fcur    type vbap-waerk,
            pa_lcur    type vbap-waerk.
data : lv_result type vbap-netwr.

call function 'CONVERT_TO_LOCAL_CURRENCY'
  exporting
*   CLIENT           = SY-MANDT
    date             = sy-datum
    foreign_amount   = pa_amnt
    foreign_currency = pa_fcur
    local_currency   = pa_lcur
*   RATE             = 0
*   TYPE_OF_RATE     = 'M'
*   READ_TCURR       = 'X'
  importing
*   EXCHANGE_RATE    =
*   FOREIGN_FACTOR   =
    local_amount     = lv_result
*   LOCAL_FACTOR     =
*   EXCHANGE_RATEX   =
*   FIXED_RATE       =
*   DERIVED_RATE_TYPE       =
  exceptions
    no_rate_found    = 1
    overflow         = 2
    no_factors_found = 3
    no_spread_found  = 4
    derived_2_times  = 5.

write: lv_result.


