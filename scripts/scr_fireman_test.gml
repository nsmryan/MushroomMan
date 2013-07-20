if (global.fireman_debug)show_debug_message("fireman test");

sprite_index=spr_fireman_small;

if (keyboard_check_pressed(vk_backspace))
{
  next_state = scr_fireman_creation;
  return(state_next);
}

return(state_continue);

