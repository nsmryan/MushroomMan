if (global.mushroomman_debug)show_debug_message("mushroomman: running");


/* check keyboard inputs */
if (keyboard_check_pressed(vk_left))
{
  global.object_direction = 180;
}
else if (keyboard_check_pressed(vk_right))
{
  global.object_direction = 0;
}
else if (keyboard_check(vk_left))
{
 global.object_direction = 180;
}
else if (keyboard_check(vk_right))
{
 global.object_direction = 0;
}

if (keyboard_check(vk_left)) || (keyboard_check(vk_right)) 
{
  if (global.object_direction == 0)
  {
    hspeed += 3;
  }
  else
  {
    hspeed -= 3;  
  }
}

if (keyboard_check_pressed(vk_up)) 
{
  y -= 3;
  vspeed -= 5;
  next_state = scr_jumping;
  return(state_next);
}

/* facing left or right */
if ((global.object_direction == 180) && (!global.droplet_flag))
{
  sprite_index = spr_mushroom_running_reverse;
  image_speed = 0.6;
}

if ((global.object_direction == 0) && (!global.droplet_flag))
{
  sprite_index = spr_mushroom_running;
  image_speed = 0.6;
}

/* check for droplet, left or right */
if ((global.droplet_flag) && (global.object_direction == 180))
{
  sprite_index = spr_mushroom_running_droplet_reverse;
  image_speed = 0.6;
}

if ((global.droplet_flag) && (global.object_direction == 0))
{
  sprite_index = spr_mushroom_running_droplet;
  image_speed = 0.6;
}

//check for contact with water
if (place_meeting(x, y, obj_water_surface) or place_meeting(x, y, obj_water))
{
  global.droplet_flag = true;
}


/* movements bounds */
hspeed = min(hspeed, 8)
hspeed = max(hspeed, -8)
vspeed = min(vspeed, 20)
vspeed = max(vspeed, -20)


/* wall-grab */
off_end_left_high  = position_meeting(x,                y,                     obj_collision)
off_end_left_mid   = position_meeting(x,                y + (sprite_height/2), obj_collision)
off_end_right_high = position_meeting(x + sprite_width, y,                     obj_collision) 
off_end_right_mid  = position_meeting(x + sprite_width, y + (sprite_height/2), obj_collision)
off_end_right_low  = position_meeting(x + sprite_width, y + sprite_height,     obj_collision)
off_end_left_low   = position_meeting(x,                y + sprite_height,     obj_collision)

if ((off_end_left_high && off_end_left_mid) || (off_end_right_high && off_end_right_mid))
{
  vspeed = 0;
  hspeed = 0;
  global.wallslide_flag = true
  next_state = scr_wallgrab;
  return state_next;
}

if (!off_end_left_low && !off_end_right_low)
{
  global.doublejump_flag = true;
  next_state = scr_falling;
  return(state_next);
}

if ((!keyboard_check(vk_left)) && (!keyboard_check(vk_right)))
{
  next_state = scr_created;
  return(state_next);
}

/* Slopes */
if (place_free(x + hspeed, y))
{
  if (!place_free(x + hspeed, y + max_slope))
  {
    x += hspeed;
    move_contact_solid(270, max_slope);
  }  
}
else if (place_free(x + hspeed, y - max_slope))
{
  //show_debug_message("up slope, vspeed " + string(vspeed) + " and hspeed " + string(hspeed));
  //show_debug_message("x = " + string(x) + ", y = " + string(y));
  y -= max_slope;
  x += hspeed + 5 * sign(hspeed);
  move_contact_solid(270, max_slope);
}

/*
if (keyboard_check_pressed(vk_space))
{
  next_state = scr_fireball;
  return(state_next);
}
*/

return state_continue;











