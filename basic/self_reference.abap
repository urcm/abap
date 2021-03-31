
class cls_selfreference definition.
  public section.
    methods init.
  private section.
    data: server type char20 value 'Log Files'.
endclass.

class cls_selfreference implementation.
  method init.
    data: server type char20 value 'User Log Files'.
    write :/ |New attribute: { server }|.
    skip 2.
    write :/ |Reference attribute: { me->server }|.
  endmethod.
endclass.

start-of-selection.
  new cls_selfreference( )->init( ).
