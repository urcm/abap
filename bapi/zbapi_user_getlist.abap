*bapi_user_getlist
* importing value(max_rows)  type bapimaxrow default 0
*  value(with_username)  type bapiusnafl default space
* exporting value(rows)  type bapiuscnt
* tables selection_range  type standard table of bapiussrge with header line optional
*  selection_exp  type standard table of bapiussexp with header line optional
*  userlist  type standard table of bapiusname with header line optional
*  return  type standard table of bapiret2 with header line optional
*
*
*Documentation
*
*Search for Users
*
*Longtext Documentation  Longtext Documentation
*
*Parameters
*
*
*importing  max_rows   Maximum Number of Lines of Hits
*importing  with_username   Read User with Name
*exporting  rows   No. of users selected
*tables  selection_range   Search for Users with a Ranges Table
*tables  selection_exp   Search for Users with Free Selections
*tables  userlist   User List
*tables

data: gt_selection_range type standard table of bapiussrge,
      gt_selection_exp   type standard table of bapiussexp,
      gt_userlist        type standard table of bapiusname,
      gt_return          type standard table of bapiret2.


types: begin of gty_username,
         username type xubname,
       end of  gty_username.

data: gt_username type standard table of gty_username.

gt_selection_range = value #( (
    parameter = 'LOGONDATA'
    field     = 'USTYP'
    sign      = 'I'
    option    = 'EQ'
    low       = 'A'
    high      = '' ) (
    parameter = 'LOGONDATA'
    field     = 'UFLAG'
    sign      = 'I'
    option    = 'EQ'
    low       = '0'
    high      = '' ) ).
    
    
call function 'BAPI_USER_GETLIST'
  exporting
*   max_rows        =     " Maximum Number of Lines of Hits
    with_username   = space    " Read User with Name
*  importing
*   rows            =     " No. of users selected
  tables
    selection_range = gt_selection_range    " Search for Users with a Ranges Table
*   selection_exp   = gt_selection_exp    " Search for Users with Free Selections
    userlist        = gt_userlist    " User List
    return          = gt_return.    " Return Parameter



gt_username = corresponding #( gt_userlist ).
*cl_demo_output=>display( gt_userlist ).
cl_demo_output=>display( gt_username ).
