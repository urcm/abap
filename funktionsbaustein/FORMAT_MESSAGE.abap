"----------------------------------------------------------------------
"Lokale Schnittstelle:
"       IMPORTING
"             ID DEFAULT SY-MSGID
"             LANG DEFAULT '-D'
"             NO DEFAULT SY-MSGNO
"             V1 DEFAULT SY-MSGV1
"             V2 DEFAULT SY-MSGV2
"             V3 DEFAULT SY-MSGV3
"             V4 DEFAULT SY-MSGV4
"       EXPORTING
"             MSG
"       EXCEPTIONS
"             NOT_FOUND
"----------------------------------------------------------------------
data: lv_msgid type sy-msgid,
      lv_msgno type sy-msgno.

data: lv_msg type char200.

lv_msgid = 'VS'.
lv_msgno = '023'.

call function 'FORMAT_MESSAGE'
  exporting
    id        = lv_msgid
    lang      = '-D'
    no        = lv_msgno
*   V1        = SY-MSGV1
*   V2        = SY-MSGV2
*   V3        = SY-MSGV3
*   V4        = SY-MSGV4
  importing
    msg       = lv_msg
  exceptions
    not_found = 1
    others    = 2.
if sy-subrc eq 0.
  write :/ lv_msg.
endif.
