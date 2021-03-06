if (global.firearms_debug)show_debug_message("firearms: running");

//go to the waiting state
if place_meeting(x + hspeed, y, obj_platformend)
{
  //firearms_direction = 0;
  next_state = scr_firearms_waiting;
  return(state_next);
}

//sprite
if instance_exists(obj_mushroomman)
{
  if (blackened)
  {
    if (firearms_direction == 180)
    {
      sprite_index = spr_firearms_running_blackened_reverse;
      image_speed= 0.3;
      hspeed -= 2;
    }
    else
    {
      sprite_index = spr_firearms_running_blackened;
      image_speed = 0.3;
      hspeed += 2;
    }
  }
  else
  {
    if (firearms_direction == 180)
    {
      sprite_index = spr_firearms_running_reverse;
      image_speed = 0.3;
      hspeed -= 2;
    }
    else
    {
      sprite_index = spr_firearms_running;
      image_speed = 0.3;
      hspeed += 2;
    }
  }

  if (!scr_firearms_look())
  {
    next_state = scr_firearms_sniffing;
    return(state_next);
  }
}
else
{
  next_state = scr_firearms_sniffing;
  return(state_next);
}
 
if place_meeting(x + 50, y, obj_mushroomman)
{
  next_state = scr_firearms_attacking;
  return(state_next);
} 

if place_meeting(x - 50, y, obj_mushroomman)
{
  next_state = scr_firearms_attacking;
  return(state_next);
} 

return(state_continue);
