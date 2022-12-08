data: gv_spell  type spell,
      gv_amount type decimals.

parameters: p_amt type decimals default 0.

initialization.

  %_p_amt_%_app_%-text = 'Amount: '.


start-of-selection.

  call function 'SPELL_AMOUNT'
    exporting
      amount   = p_amt
    importing
      in_words = gv_spell.

  write:/ gv_spell-word.
