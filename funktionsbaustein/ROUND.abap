data: zahl1 type p decimals 2 value '18.246',
      zahl2 type p decimals 2.

call function 'ROUND'
  exporting
   DECIMALS            = 1
    input               = zahl1
   SIGN                = '-' " - sign round down & mit "-" Zeichen wird abgerundet.
 IMPORTING
   OUTPUT              = zahl2
* EXCEPTIONS
*   INPUT_INVALID       = 1
*   OVERFLOW            = 2
*   TYPE_INVALID        = 3
*   OTHERS              = 4
          .
if sy-subrc <> 0.
* Implement suitable error handling here
endif.


write :/ zahl2.
