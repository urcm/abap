*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     VALUE(OBJECTCLASS) LIKE  CDHDR-OBJECTCLAS
*"     VALUE(OBJECTID) LIKE  CDHDR-OBJECTID
*"     VALUE(PLANNED_CHANGE_NUMBER) LIKE  CDHDR-PLANCHNGNR DEFAULT
*"       SPACE
*"     VALUE(PLANNED_OR_REAL_CHANGES) LIKE  CDHDR-CHANGE_IND DEFAULT
*"       SPACE
*"  EXCEPTIONS
*"      SEQUENCE_INVALID


data: lv_objectclass like  cdhdr-objectclas value 'VERKBELEG',
      lv_objectid    like  cdhdr-objectid value '1740056124'.

call function 'CHANGEDOCUMENT_OPEN'
  exporting
    objectclass      = lv_objectclass
    objectid         = lv_objectid
*   PLANNED_CHANGE_NUMBER         = ' '
*   PLANNED_OR_REAL_CHANGES       = ' '
  exceptions
    sequence_invalid = 1.

