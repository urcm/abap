data: lv_address_normal type  sx_address.
data: lv_local type  sx_addr.
data: lv_domain type  sx_addr.
data: lv_comment type  sx_addr.
data: lv_addr_normal_no_upper type  sx_address.
data: lv_addr_normal_no_up_with_com type  sx_address.

parameters: p_email type char100.

data(lv_address_unstruct) = value sx_address( address = p_email
                                              type    = 'INT' ).


INITIALIZATION.

%_p_email_%_app_%-text = 'Email Adresse:'.

START-OF-SELECTION.

call function 'SX_INTERNET_ADDRESS_TO_NORMAL'
  exporting
    address_unstruct               = lv_address_unstruct
*   COMPLETE_ADDRESS               = lv_complete_address
  importing
    address_normal                 = lv_address_normal
    local                          = lv_local
    domain                         = lv_domain
    comment                        = lv_comment
    addr_normal_no_upper           = lv_addr_normal_no_upper
    addr_normal_no_up_with_comment = lv_addr_normal_no_up_with_com
  exceptions
    error_address_type             = 1
    error_address                  = 2
    error_group_address            = 3
    others                         = 4.
if sy-subrc eq 0.
  write :/ 'Die E-Mail-Adresse ist gültig -->' , p_email .
  write :/  |Email Name: { lv_local } |.
  write :/ |Email Domain: { lv_domain } |.

else.
  message 'Die E-Mail-Adresse ist ungültig.' type 'I'.
*  write: /  sy-subrc.
endif.
