

*bapi_user_get_detail
* importing value(username)  type xubname
*  value(cache_results)  type flag_x default 'X'
* exporting value(logondata)  type bapilogond
*  value(defaults)  type bapidefaul
*  value(address)  type bapiaddr3
*  value(company)  type bapiuscomp
*  value(snc)  type bapisncu
*  value(ref_user)  type bapirefus
*  value(alias)  type bapialias
*  value(uclass)  type bapiuclass
*  value(lastmodified)  type bapimoddat
*  value(islocked)  type bapislockd
*  value(identity)  type bapiidentity
*  value(admindata)  type bapiuseradmin
* tables parameter  type standard table of bapiparam with header line optional
*  profiles  type standard table of bapiprof with header line optional
*  activitygroups  type standard table of bapiagr with header line optional
*  return  type standard table of bapiret2 with header line
*  addtel  type standard table of bapiadtel with header line optional
*  addfax  type standard table of bapiadfax with header line optional
*  addttx  type standard table of bapiadttx with header line optional
*  addtlx  type standard table of bapiadtlx with header line optional
*  addsmtp  type standard table of bapiadsmtp with header line optional
*  addrml  type standard table of bapiadrml with header line optional
*  addx400  type standard table of bapiadx400 with header line optional
*  addrfc  type standard table of bapiadrfc with header line optional
*  addprt  type standard table of bapiadprt with header line optional
*  addssf  type standard table of bapiadssf with header line optional
*  adduri  type standard table of bapiaduri with header line optional
*  addpag  type standard table of bapiadpag with header line optional
*  addcomrem  type standard table of bapicomrem with header line optional
*  parameter1  type standard table of bapiparam1 with header line optional
*  groups  type standard table of bapigroups with header line optional
*  uclasssys  type standard table of bapiuclasssys with header line optional
*  extidhead  type standard table of bapiusextidhead with header line optional
*  extidpart  type standard table of bapiusextidpart with header line optional
*  systems  type standard table of bapircvsys with header line optional
*
*
*Documentation
*
*Read User Details
*
*Longtext Documentation  Longtext Documentation
*
*Parameters
*
*
*importing  username   User Name
*importing  cache_results   Temporarily buffer results in work process
*exporting  logondata   Structure with Logon Data
*exporting  defaults   Structure with User Defaults
*exporting  address   Address Data
*exporting  company   Company for Company Address
*exporting  snc   Secure Network Communication Data
*exporting  ref_user   User Name of the Reference User
*exporting  alias   User Name Alias
*exporting  uclass   License-Related User Classification
*exporting  lastmodified   User: Last Change (Date and Time)
*exporting  islocked   User Lock
*exporting  identity   Person Assignment of an Identity
*exporting  admindata   User: Administration Data
*tables  parameter   Table with User Parameters
*tables  profiles   Profiles
*tables  activitygroups   Activity Groups
*tables  return   Return Structure
*tables  addtel   BAPI Structure Telephone Numbers
*tables  addfax   BAPI Structure Fax Numbers
*tables  addttx   BAPI Structure Teletex Numbers
*tables  addtlx   BAPI Structure Telex Numbers
*tables  addsmtp   E-Mail Addresses BAPI Structure
*tables  addrml   Inhouse Mail BAPI Structure
*tables  addx400   BAPI Structure X400 Addresses
*tables  addrfc   BAPI Structure RFC Addresses
*tables  addprt   BAPI Structure Printer Addresses
*tables  addssf   BAPI Structure SSF Addresses
*tables  adduri   BAPI Structure: URL, FTP, and so on
*tables  addpag   BAPI Structure Pager Numbers
*tables  addcomrem   BAPI Structure Communication Comments
*tables  parameter1   Replaces Parameter (Length 18 -> 40)
*tables  groups   Transfer Structure for a List of User Groups
*tables  uclasssys   System-Specific License-Related User Classification
*tables  extidhead   Header Data for External ID of a User
*tables  extidpart   Part of a Long Field for the External ID of a User
*tables


data: gt_logondata    type bapilogond,
      gt_defaults     type bapidefaul,
      gt_address      type bapiaddr3,
      gt_company      type bapiuscomp,
      gt_admindata    type bapiuseradmin,
      gt_snc          type bapisncu,
      gt_ref_user     type bapirefus,
      gt_alias        type bapialias,
      gt_uclass       type bapiuclass,
      gt_lastmodified type bapimoddat,
      gt_islocked     type bapislockd,
      gt_identity     type bapiidentity.
      


data: gt_return  type standard table of bapiret2.


call function 'BAPI_USER_GET_DETAIL'
  exporting
    username     = sy-uname     " User Name
*   cache_results  = 'X'    " Temporarily buffer results in work process
  importing
    logondata    = gt_logondata     " Structure with Logon Data
    defaults     = gt_defaults   " Structure with User Defaults
    address      = gt_address  " Address Data
    company      = gt_company     " Company for Company Address
    snc          = gt_snc    " Secure Network Communication Data
    ref_user     = gt_ref_user    " User Name of the Reference User
    alias        = gt_alias    " User Name Alias
    uclass       = gt_uclass    " License-Related User Classification
    lastmodified = gt_lastmodified    " User: Last Change (Date and Time)
    islocked     = gt_islocked    " User Lock
    identity     = gt_identity    " Person Assignment of an Identity
    admindata    = gt_admindata    " User: Administration Data
  tables
*   parameter    =     " Table with User Parameters
*   profiles     =     " Profiles
*   activitygroups =     " Activity Groups
    return       = gt_return    " Return Structure
*   addtel       =     " BAPI Structure Telephone Numbers
*   addfax       =     " BAPI Structure Fax Numbers
*   addttx       =     " BAPI Structure Teletex Numbers
*   addtlx       =     " BAPI Structure Telex Numbers
*   addsmtp      =     " E-Mail Addresses BAPI Structure
*   addrml       =     " Inhouse Mail BAPI Structure
*   addx400      =     " BAPI Structure X400 Addresses
*   addrfc       =     " BAPI Structure RFC Addresses
*   addprt       =     " BAPI Structure Printer Addresses
*   addssf       =     " BAPI Structure SSF Addresses
*   adduri       =     " BAPI Structure: URL, FTP, and so on
*   addpag       =     " BAPI Structure Pager Numbers
*   addcomrem    =     " BAPI Structure Communication Comments
*   parameter1   =     " Replaces Parameter (Length 18 -> 40)
*   groups       =     " Transfer Structure for a List of User Groups
*   uclasssys    =     " System-Specific License-Related User Classification
*   extidhead    =     " Header Data for External ID of a User
*   extidpart    =     " Part of a Long Field for the External ID of a User
*   systems      =     " BAPI Structure for CUA Target Systems
  .
