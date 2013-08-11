if (global.mushroomman_debug)show_debug_message("mushroomman: doublejump");
vspeed += 2;



if (global.object_direction == 180)
{
  sprite_index = spr_mushroom_doublejump_reverse;
}

if (global.object_direction == 0)
{
  sprite_index = spr_mushroom_doublejump;
}

//check droplet and direction, left or right
if (global.droplet_flag) && (global.object_direction == 0)
{
  sprite_index = spr_mushroom_doublejump_droplet;
}

if (global.droplet_flag) && (global.object_direction == 180)
{
  sprite_index = spr_mushroom_doublejump_droplet_reverse;
}


//cap movement speed
if (hspeed >= 8)   hspeed = 8;
if (vspeed >= 10)  vspeed = 10;
if (hspeed <= -8)  hspeed = -8;
if (vspeed <= -10) vspeed = -10;

/*
if (keyboard_check_pressed(vk_space))
{
  next_state = scr_fireball;
  return(state_next);
}
*/

//check keyboard inputs
if (keyboard_check(vk_left))  
{
  hspeed -= 2;
  global.object_direction = 180;
}

if (keyboard_check(vk_right)) 
{
  global.object_direction = 0;
  hspeed += 2;
}

//move upwards for a while
if ((double_jump < DOUBLE_JUMP_MAX) && (keyboard_check(vk_up)))
{
  vspeed -= 4;
  double_jump += 1;
  return(state_continue);
}
else 
{ 
  global.magicforce_flag = false;
  next_state = scr_falling;
  return(state_next);
}

if (!place_free(x, y + 1))
{
  global.magicforce_flag = false;
  next_state = scr_created;
  return(state_next);
}


//droplet throw
if (keyboard_check(vk_shift) && global.droplet_flag)
{
  magicforce_flag = false;
  next_state = scr_droplet;
  return(state_next);
}

next_state = scr_falling;
return(state_next);
