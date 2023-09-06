
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
