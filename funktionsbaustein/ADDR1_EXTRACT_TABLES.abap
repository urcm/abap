"*"Local Interface:
*"  TABLES
*"      T_ADDRESS_KEYS STRUCTURE  ADDR_KEY
*"      T_ADRC STRUCTURE  ADRC OPTIONAL
*"      T_ADRCT STRUCTURE  ADRCT OPTIONAL
*"      T_ADR2 STRUCTURE  ADR2 OPTIONAL
*"      T_ADR3 STRUCTURE  ADR3 OPTIONAL
*"      T_ADR4 STRUCTURE  ADR4 OPTIONAL
*"      T_ADR5 STRUCTURE  ADR5 OPTIONAL
*"      T_ADR6 STRUCTURE  ADR6 OPTIONAL
*"      T_ADR7 STRUCTURE  ADR7 OPTIONAL
*"      T_ADR8 STRUCTURE  ADR8 OPTIONAL
*"      T_ADR9 STRUCTURE  ADR9 OPTIONAL
*"      T_ADR10 STRUCTURE  ADR10 OPTIONAL
*"      T_ADR11 STRUCTURE  ADR11 OPTIONAL
*"      T_ADR12 STRUCTURE  ADR12 OPTIONAL
*"      T_ADR13 STRUCTURE  ADR13 OPTIONAL
*"      T_ADRT STRUCTURE  ADRT OPTIONAL
*"  EXCEPTIONS
*"      EMPTY_TABLE



data: gt_address_keys type table of addr_key,
      gs_address_keys like line of gt_address_keys.

data: gt_adrc type table of adrc,
      gt_adr3 type table of adr3.

gs_address_keys-addrnumber = '0000000104'.
gs_address_keys-addr_type = '1'.
append gs_address_keys to gt_address_keys.

call function 'ADDR1_EXTRACT_TABLES'
  tables
    t_address_keys = gt_address_keys
    t_adrc         = gt_adrc
*   T_ADRCT        =
*   T_ADR2         =
    t_adr3         = gt_adr3
*   T_ADR4         =
*   T_ADR5         =
*   T_ADR6         =
*   T_ADR7         =
*   T_ADR8         =
*   T_ADR9         =
*   T_ADR10        =
*   T_ADR11        =
*   T_ADR12        =
*   T_ADR13        =
*   T_ADRT         =
* EXCEPTIONS
*   EMPTY_TABLE    = 1
*   OTHERS         = 2
  .
*if sy-subrc = 0.
*  cl_demo_output=>begin_section( 'SPFLI Example' ).
*  cl_demo_output=>display( gt_adrc ).
*  cl_demo_output=>display( gt_adr3 ).
*endif.

data(out) = cl_demo_output=>new( ).
out->write( gt_adrc ).
out->write( gt_adr3 ).
out->display( ).
