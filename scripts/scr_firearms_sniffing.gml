if (global.firearms_debug)show_debug_message("firearms: sniffing");

hspeed = 0;
vspeed = 0;

//go to idle after 100 frames
if (state_time > 100)
{
  next_state = (scr_firearms_idle);
  return(state_continue);
}

//sprite
if (firearms_direction == 0) && (blackened == false)
{
  sprite_index = spr_firearms_waiting_reverse;
}
else if (blackened == true) && (firearms_direction == 0) 
{
    sprite_index = spr_firearms_waiting_blackened_reverse;
}

if (firearms_direction == 180) && (blackened == false)
{
  sprite_index = spr_firearms_waiting;
}
else if (blackened == true) && (firearms_direction == 180)
{
      sprite_index = spr_firearms_waiting_blackened;
}

//line of sight
if instance_exists(obj_mushroomman)
{
if  (obj_mushroomman.y >= y) && (obj_mushroomman.y <= y+96) && (obj_mushroomman.x > x) 
{
  firearms_direction = 0;
  next_state = scr_firearms_running;
  return(state_next);
}

if (obj_mushroomman.y >= y) && (obj_mushroomman.y <= y+96) && (obj_mushroomman.x < x)
{
  firearms_direction = 180;
  next_state = scr_firearms_running;
  return(state_next);
}
}

return(state_continue)
