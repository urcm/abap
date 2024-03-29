*"*"Globale Schnittstelle:
*"  IMPORTING
*"     VALUE(ARCHIVE_HANDLE) LIKE  SY-TABIX DEFAULT 0
*"     VALUE(CHANGENUMBER) LIKE  CDPOS-CHANGENR DEFAULT SPACE
*"     VALUE(DATE_OF_CHANGE) LIKE  CDHDR-UDATE DEFAULT '00000000'
*"     VALUE(OBJECTCLASS) LIKE  CDHDR-OBJECTCLAS
*"     VALUE(OBJECTID) LIKE  CDHDR-OBJECTID DEFAULT SPACE
*"     VALUE(TABLEKEY) LIKE  CDPOS-TABKEY DEFAULT SPACE
*"     VALUE(TABLENAME) LIKE  CDPOS-TABNAME DEFAULT SPACE
*"     VALUE(TIME_OF_CHANGE) LIKE  CDHDR-UTIME DEFAULT '000000'
*"     VALUE(USERNAME) LIKE  CDHDR-USERNAME DEFAULT SPACE
*"     VALUE(LOCAL_TIME) DEFAULT SPACE
*"     VALUE(TIME_ZONE) TYPE  TTZZ-TZONE DEFAULT 'UTC'
*"     VALUE(TABLEKEY254) TYPE  CDPOS_UID-TABKEY DEFAULT SPACE
*"     VALUE(KEYGUID) TYPE  CDPOS_UID-KEYGUID DEFAULT SPACE
*"     VALUE(DATE_UNTIL) TYPE  CDHDR-UDATE DEFAULT '99991231'
*"     VALUE(TIME_UNTIL) TYPE  CDHDR-UTIME DEFAULT '235959'
*"     VALUE(KEYGUID_STR) TYPE  CDPOS_STR-KEYGUID DEFAULT SPACE
*"     VALUE(READ_CHANGEDOCU) TYPE  C DEFAULT SPACE
*"     REFERENCE(I_PREP_UNIT) TYPE  C DEFAULT 'X'
*"     VALUE(NOPLUS_ASWILDCARD_INOBJID) TYPE  C DEFAULT SPACE
*"     VALUE(I_HOT) TYPE  C DEFAULT SPACE
*"  EXPORTING
*"     VALUE(ET_CDRED_STR) TYPE  CDRED_STR_TAB
*"  TABLES
*"      EDITPOS STRUCTURE  CDRED
*"  EXCEPTIONS
*"      NO_POSITION_FOUND
*"      WRONG_ACCESS_TO_ARCHIVE
*"      TIME_ZONE_CONVERSION_ERROR

data: lv_objectclass like  cdhdr-objectclas value 'Z_DEMO'.
data: lt_result type table of cdred.


call function 'CHANGEDOCUMENT_READ'
  exporting
*   ARCHIVE_HANDLE             = 0
*   CHANGENUMBER               = ' '
*   DATE_OF_CHANGE             = '00000000'
    objectclass                = lv_objectclass
*   OBJECTID                   = ' '
*   TABLEKEY                   = ' '
*   TABLENAME                  = ' '
*   TIME_OF_CHANGE             = '000000'
*   USERNAME                   = ' '
*   LOCAL_TIME                 = ' '
*   TIME_ZONE                  = 'UTC'
*   TABLEKEY254                = ' '
*   KEYGUID                    = ' '
*   DATE_UNTIL                 = '99991231'
*   TIME_UNTIL                 = '235959'
*   KEYGUID_STR                = ' '
*   READ_CHANGEDOCU            = ' '
*   I_PREP_UNIT                = 'X'
*   NOPLUS_ASWILDCARD_INOBJID  = ' '
*   I_HOT                      = ' '
* IMPORTING
*   ET_CDRED_STR               =
  tables
    editpos                    = lt_result
  exceptions
    no_position_found          = 1
    wrong_access_to_archive    = 2
    time_zone_conversion_error = 3.


cl_demo_output=>display( lt_result ).
