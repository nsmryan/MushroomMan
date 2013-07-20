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
if (global.droplet_flag == true) && (global.object_direction == 0)
{
  sprite_index = spr_mushroom_doublejump_droplet;

}

if (global.droplet_flag == true) && (global.object_direction == 180)
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
  x -= 5;
  global.object_direction=180;
}

if (keyboard_check(vk_right)) 
{
  global.object_direction=0;
  x += 5;
}

//move upwards for a while
if ((state_time < 20) && (keyboard_check(vk_up)))
{
  //y -= 20;
  vspeed -= 4;
  return(state_continue);
}
else 
{ 
  global.doublejump_flag=false;
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
if (keyboard_check(vk_shift) && global.droplet_flag==true)
{
  magicforce_flag = false;
  next_state=scr_droplet;
  return(state_next);
}

next_state = scr_falling;
return(state_next);
