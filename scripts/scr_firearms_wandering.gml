if (global.firearms_debug)show_debug_message("firearms: wandering");

//go to the waiting state
if place_meeting(x + hspeed, y, obj_collision) || place_meeting(x + hspeed, y, obj_platformend)
{
  if (firearms_direction == 180)firearms_direction = 0;
  else firearms_direction = 180;
}

if (firearms_direction == 0)
{
  hspeed = 1;
}
else
{
  hspeed = -1;
}

//sprite
if (blackened)
{
  if (firearms_direction == 180)
  {
    sprite_index = spr_firearms_running_blackened_reverse;
    image_speed= 0.1;
  }
  else
  {
    sprite_index = spr_firearms_running_blackened;
    image_speed = 0.1;
  }
}
else
{
  if (firearms_direction == 180)
  {
    sprite_index = spr_firearms_running_reverse;
    image_speed = 0.1;
  }
  else
  {
    sprite_index = spr_firearms_running;
    image_speed = 0.1;
  }
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

if (instance_exists(obj_mushroomman))
{
  sight_blocked = collision_line(x, y, obj_mushroomman.x, obj_mushroomman.y, obj_collision, true, false);
  if (!sight_blocked && distance_to_object(obj_mushroomman) < MAX_SEE_DIST)
  {
    next_state = scr_firearms_idle;
    return (state_next);
  }
}


//Line of sight
if (scr_firearms_look())
{
  next_state = scr_firearms_running;
  return(state_next);
}

if (random(1) < 0.01)
{
  next_state = scr_firearms_idle;
  return (state_next);
}

return(state_continue);
