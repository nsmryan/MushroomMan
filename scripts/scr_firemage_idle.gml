if (global.debug_firemage)show_debug_message("firemage: idle");

if (scr_firemage_look())
{
  next_state = scr_firemage_attacking;
  return state_next;
}

return state_continue;
