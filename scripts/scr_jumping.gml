if (global.mushroomman_debug)show_debug_message("mushroomman: jumping");
global.doublejump_flag = true;
vspeed += 2;

//check driection, left or right
if (global.object_direction == 180) && !global.droplet_flag
{
  sprite_index = spr_mushroom_jumping_reverse;
}

if (global.object_direction == 0) && !global.droplet_flag
{
  sprite_index = spr_mushroom_jumping;
}

if (hspeed < 0) && !global.droplet_flag
{
  sprite_index = spr_mushroom_falling_reverse;
}

if (hspeed > 0) && !global.droplet_flag 
{
  sprite_index = spr_mushroom_falling;
}

//check droplet and direction, left or right
if global.droplet_flag && (global.object_direction == 0)
{
  sprite_index = spr_mushroom_jumping_droplet;
}

if global.droplet_flag && (global.object_direction == 180)
{
  sprite_index = spr_mushroom_jumping_droplet_reverse;
}

//wall-grab
if ((off_end_left_high && off_end_left_mid) || (off_end_right_high && off_end_right_mid))
{
  vspeed = 0;
  hspeed = 0;
  global.wallslide_flag = true
  next_state = scr_wallgrab;
  return(state_next);
}
 
//check for contact with water
if (place_meeting(x,y, obj_water_surface)) or (place_meeting(x,y, obj_water))
{
  global.droplet_flag = true;
}

/*
//check for fireball
if (keyboard_check_pressed(vk_space))
{
  instance_create(x+hspeed, y+vspeed, obj_fireball);

if (global.object_direction==180)
{
  sprite_index = spr_mushroom_fireball_reverse;
}

if (global.object_direction==0)
{
  sprite_index=spr_mushroom_fireball;
}

//check for droplet
if global.droplet_flag==true && global.object_direction==0
{
sprite_index=spr_mushroom_fireball_droplet;
}

if global.droplet_flag==true && global.object_direction==180
{
sprite_index=spr_mushroom_fireball_droplet_reverse;
}

}*/



if !place_free(x + hspeed, y) && (global.object_direction == 180)
{
  move_contact_solid(180, hspeed);
  vspeed += 2;
  hspeed = 0;

}

if !place_free(x + hspeed, y) && (global.object_direction == 0)
{
  move_contact_solid(0,hspeed);
  vspeed += 2;
  hspeed = 0;

}

//check keyboard inputs
if (keyboard_check(vk_left))  
{
  hspeed -= 5;
  global.object_direction = 180;
  sprite_index = spr_mushroom_running_reverse;
}

if (keyboard_check(vk_right)) 
{
  global.object_direction = 0;
  hspeed += 5;
  sprite_index = spr_mushroom_running;
}


//movements checks
if (hspeed >= 8) hspeed = 8;
if (vspeed >= 20) vspeed = 15;
if (hspeed <= -8) hspeed = -8;
if (vspeed <= -20) vspeed = -15;


/*if (keyboard_check_pressed(vk_up) && (!global.doublejump_flag))
{
  global.doublejump_flag = true;
}
*/

if (!place_free(x + hspeed, y + vspeed) && (vspeed > 0) && (hspeed < 0))
{
  next_state = scr_created;
  return(state_next);
}

if (!place_free(x+hspeed, y+vspeed) && (vspeed > 0) && (hspeed < 0))
{
  next_state = scr_created;
  return(state_next);
}

//move upwards for a while
if ((state_time < 9) && (keyboard_check(vk_up)))
{
  vspeed -= 3;
  return(state_continue);
}

//droplet throw
if (keyboard_check(vk_shift) && global.droplet_flag)
{
  next_state = scr_droplet;
  return(state_next);
}

//after upwards motion is spent, move to falling state
jump_time = 3;
next_state = scr_falling;
return(state_next);
