if (global.mushroomman_debug)show_debug_message("mushroomman: creation");

vspeed += 2;


sprite_index = spr_mushroom_revive;

just_created = false;

/*
if ((state_time == 35) &&  (global.timer < 80))
{
  next_state = scr_created;
  return(state_next);
}
else if (state_time == 56) 
{
  next_state = scr_created;
  return(state_next);
}
*/
if ((image_index >= image_number-1))
{
  next_state = scr_created;
  return(state_next);
}

return(state_continue);































































