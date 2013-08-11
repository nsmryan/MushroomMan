if (global.mushroomman_debug)show_debug_message("mushroomman: wallgrab");

global.doublejump_flag = true;
double_jump = 0;

//from jump situation
if (state_time > 10)
{
  //movements checks
  vspeed += 1;
  global.sliding_down = true;
}
else
{
  vspeed = 0;
  global.sliding_down = false;
}

global.wallgrab_flag = false;
global.onwall_flag = true;

if (keyboard_check_pressed(vk_space))
{
  fromjump_flag = false;
  next_state = scr_wallgrab_fireball;
  return state_next;
}

if place_meeting(x, y + vspeed + 1, obj_collision)
{
  fromjump_flag = false;
  global.wallslide_flag = false;
  global.sliding_down = false;
  next_state = scr_created;
  return state_next;
}

off_end_left_low  = !position_meeting(x,                y + sprite_height,     obj_collision)
off_end_left_mid  = !position_meeting(x,                y + (sprite_height/2), obj_collision)
off_end_right_low = !position_meeting(x + sprite_width, y + sprite_height,     obj_collision) 
off_end_right_mid = !position_meeting(x + sprite_width, y + (sprite_height/2), obj_collision)

if (off_end_left_low && off_end_left_mid && off_end_right_low && off_end_right_mid)
{
  global.onwall_flag = false;
  fromjump_flag = false;
  global.wallslide_flag = false;
  global.sliding_down = false;
  next_state = scr_falling;
  return state_next;
}

if (global.droplet_flag)
{
  if (global.object_direction == 0)
  {
    sprite_index = spr_mushroom_wallgrab_droplet;
  }
  else
  {
    sprite_index = spr_mushroom_wallgrab_droplet_reverse;
  }
}
else
{
  if (global.object_direction == 0)
  { 
    sprite_index = spr_mushroom_wallgrab;
  }
  else
  { 
    sprite_index = spr_mushroom_wallgrab_reverse;
  }
}

vspeed = max(min(5, vspeed), -5)

//check keyboard inputs

// offwall jumping state if up is pressed
if (keyboard_check_pressed(vk_up) && global.object_direction == 0)
{
  x -= 3;
  hspeed -= 5;
  y -= 3;
  global.offwalltotheleft_flag = true;
  fromjump_flag = false;
  global.wallslide_flag = false;
  global.sliding_down = false;
  next_state = scr_offwall;
  return state_next;
}

if (keyboard_check(vk_up) && global.object_direction == 180)
{ 
  x += 3;
  hspeed += 5;
  y -= 3;
  global.offwalltotheright_flag = true;
  fromjump_flag = false;
  global.wallslide_flag = false;
  global.sliding_down = false;
  next_state = scr_offwall;
  return state_next;
}

//fall if right or left is pressed
if (keyboard_check(vk_left) && global.object_direction == 0)
{ 
  hspeed -= 6;
  x -= 2;
  global.doublejump_flag = true;
  fromjump_flag = false;
  global.wallslide_flag = false;
  next_state = scr_falling;
  return state_next;
}

if (keyboard_check(vk_right) && global.object_direction == 180)
{ 
  hspeed += 6;
  x += 2;
  global.doublejump_flag = true;
  fromjump_flag = false;
  global.wallslide_flag = false;
  global.sliding_down = false;
  next_state = scr_falling;
  return state_next;
}

return state_continue;
