if (global.mushroomman_debug)show_debug_message("mushroomman: created");

friction = 2;
double_jump = 0;

//gravity
if place_free(x, y+2)
{
  vspeed += 3;    
}

//check for contact with water
if (place_meeting(x, y, obj_water_surface) or (place_meeting(x, y, obj_water)))
{
  global.droplet_flag = true;
}

//check keyboard inputs
if (keyboard_check(vk_left))  
{
  global.object_direction = 180;
  next_state = scr_running;
  return(state_next);
}

if (keyboard_check(vk_right)) 
{
  global.object_direction = 0;
  next_state = scr_running;
  return(state_next);
}

//Wallgrab
off_end_left_high  = position_meeting(x,                y,                     obj_collision)
off_end_left_mid   = position_meeting(x,                y + (sprite_height/2), obj_collision)
off_end_right_high = position_meeting(x + sprite_width, y,                     obj_collision) 
off_end_right_mid  = position_meeting(x + sprite_width, y + (sprite_height/2), obj_collision)

if ((off_end_left_high && off_end_left_mid) || (off_end_right_high && off_end_right_mid))
{
  vspeed = 0;
  hspeed = 0;
  global.wallslide_flag = true
  next_state = scr_wallgrab;
  return(state_next);
}

//check for droplet flag
if (global.droplet_flag)
{
  //check for sliding, with droplet
  if (hspeed > 0)
  {
    sprite_index = spr_mushroom_sliding_droplet;
  }
  else if (hspeed < 0)
  {
    sprite_index = spr_mushroom_sliding_droplet_reverse;
  }
  else
  {
    sprite_index = spr_mushroomman_droplet;
  }
}
else
{
  //check for sliding
  if (hspeed > 0)
  {
    sprite_index = spr_mushroom_sliding;
  }
  else if (hspeed < 0)
  {
    sprite_index = spr_mushroom_sliding_reverse;
  }
  else
  {
    sprite_index = spr_mushroomman;
  }
}


//jump brings to falling state
if (keyboard_check_pressed(vk_up) && !place_free(x,y+3))
{
  y -= 3;
  vspeed -= 5;
  next_state = scr_jumping;
  return state_next;
}

off_end_right_low  = position_meeting(x + sprite_width, y + sprite_height,     obj_collision)
off_end_left_low   = position_meeting(x,                y + sprite_height,     obj_collision)
if (!off_end_left_low && !off_end_right_low)
{
  global.doublejump_flag = true;
  next_state = scr_falling;
  return(state_next);
}

//droplet throw
if (keyboard_check(vk_shift) && global.droplet_flag)
{
  next_state = scr_droplet;
  return state_next;
}

//idle situation
if keyboard_check(vk_anykey)
{
  idle_counter = 0;
}
else
{
  idle_counter += 1;
}

if (idle_counter > 500)
{
  next_state = scr_idle;
  return state_next;
}

return state_continue;
