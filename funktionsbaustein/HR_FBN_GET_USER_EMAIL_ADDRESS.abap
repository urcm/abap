data: subrc         type sy-subrc,
      email_address type string.
data: error_table   type standard table of rpbenerr.

call function 'HR_FBN_GET_USER_EMAIL_ADDRESS'
  exporting
    user_id       = sy-uname
    reaction      = sy-msgty
  importing
    subrc         = subrc
    email_address = email_address
  tables
    error_table   = error_table.

write: / sy-uname.

data(lv_email) = cond string( when email_address ne '' then email_address
                              else 'Die registrierte E-Mail-Adresse wurde nicht gefunden.').


write :/ lv_email.

