if (global.fireman_debug)show_debug_message("fireman idle");


sprite_index = spr_fireman_standing;


if (keyboard_check_pressed(vk_backspace))
{
  next_state = scr_fireman_test;
  return(state_next);
}

return(state_continue);



