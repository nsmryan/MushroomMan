if (global.mushroomman_debug)show_debug_message("mushroomman: falling");

if (state_time < 2)
{
  vspeed += 0.5;
}
else if (state_time < 5)
{
  vspeed += 1;
}
else if (state_time < 8)
{
  vspeed += 1.5;
}
else
{
  vspeed += 2;
}

//if there is something beneath him, return to default
if (!place_free(x, y + 1))
{
  next_state = scr_created;
  return(state_next);
}

//check for direction
if (global.object_direction == 180)
{
  sprite_index = spr_mushroom_falling_reverse;
}

if (global.object_direction == 0)
{
  sprite_index = spr_mushroom_falling;
}

if (hspeed < 0)
{
  sprite_index = spr_mushroom_falling_reverse;
}
else
{
  sprite_index = spr_mushroom_falling;
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

//check keyboard inputs
if (keyboard_check(vk_left))  
{
  global.object_direction = 180;
  hspeed -= 7;
  sprite_index = spr_mushroom_falling_reverse;
}

if (keyboard_check(vk_right)) 
{
  global.object_direction = 0;
  hspeed += 7;
  sprite_index = spr_mushroom_falling;
}



//check droplet and direction, left or right
if (global.droplet_flag && (global.object_direction == 0))
{
  sprite_index = spr_mushroom_falling_droplet;

}

if (global.droplet_flag && (global.object_direction == 180))
{
  sprite_index = spr_mushroom_falling_droplet_reverse;
}

//movements checks
if (hspeed >= 8) hspeed = 8;
if (vspeed >= 15) vspeed = 15;
if (hspeed <= -8) hspeed = -8;
if (vspeed <= -15) vspeed = -15;

/*
if (keyboard_check_pressed(vk_space))
{
  next_state = scr_fireball;
  return(state_next);
}
*/

//allow doublejump in jump state
if ((keyboard_check_pressed(vk_up)) && (double_jump < DOUBLE_JUMP_MAX))
{
  global.magicforce_flag = true;
  next_state = scr_doublejump;
  return(state_next);
}

//droplet throw
if (keyboard_check(vk_shift) && global.droplet_flag)
{
  next_state = scr_droplet;
  return(state_next);
}

//otherwise continue falling

return(state_continue);
