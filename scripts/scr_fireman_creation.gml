if (global.fireman_debug)show_debug_message("fireman creation");

sprite_index=spr_fireman_creation;

if (image_index == image_number-1) 
{
  next_state = scr_fireman_idle;
  return(state_next);
}

return(state_continue);


