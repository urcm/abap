types: ty_spfli type standard table of spfli
                with non-unique key carrid connid.
data: gt_spfli type ty_spfli.

data: gt_fieldcat type lvc_t_fcat,
      gs_fieldcat type lvc_s_fcat.

class lcl_event_handler definition.
  public section.
  protected section.
  private section.

endclass.
