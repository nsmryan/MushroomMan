if (global.firearms_debug)show_debug_message("firearms: sniffing");

hspeed = 0;
vspeed = 0;

//go to idle after 100 frames
if (state_time > 100)
{
  next_state = scr_firearms_idle;
  return(state_next);
}

//sprite
if (blackened)
{
  if (firearms_direction == 180) 
  {
    sprite_index = spr_firearms_waiting_blackened_reverse;
  }
  else
  {
    sprite_index = spr_firearms_waiting_blackened;
  }
}
else
{
  if (firearms_direction == 180)
  {
    sprite_index = spr_firearms_waiting_reverse;
  }
  else
  {
    sprite_index = spr_firearms_waiting;
  }
}


//line of sight
if instance_exists(obj_mushroomman)
{
  if (scr_firearms_look())
  {
    next_state = scr_firearms_running;
    return(state_next);
  }
}

return(state_continue)
