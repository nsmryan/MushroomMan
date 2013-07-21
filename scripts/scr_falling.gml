if (global.mushroomman_debug)show_debug_message("mushroomman: falling");

if state_time < 2
{
  vspeed += .5;
}
else if state_time < 5 
{
  vspeed += 1;
}
else if state_time < 8
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
if (!place_free(x+8, y) && global.object_direction == 0)
{
  move_contact_solid(0,8);
  vspeed = 0;
  hspeed = 0;
  global.wallslide_flag = true
  next_state = scr_wallgrab;
  return(state_next);
}

if (!place_free(x-8, y) && global.object_direction == 180)
{
  move_contact_solid(180,8);
  global.wallslide_flag = true
  vspeed = 0;
  hspeed = 0;
  next_state = scr_wallgrab;
  return(state_next);
}


//check keyboard inputs
if (keyboard_check(vk_left))  
{
  x -= 7;
  global.object_direction = 180;
  sprite_index = spr_mushroom_falling_reverse;
}

if (keyboard_check(vk_right)) 
{
  global.object_direction = 0;
  x += 7;
  sprite_index = spr_mushroom_falling;
}



//check droplet and direction, left or right
if (global.droplet_flag == true && global.object_direction == 0)
{
  sprite_index=spr_mushroom_falling_droplet;

}

if (global.droplet_flag == true && global.object_direction == 180)
{
  sprite_index=spr_mushroom_falling_droplet_reverse;
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


if ((keyboard_check_pressed(vk_up)) && (global.doublejump_flag == true))
{
  global.magicforce_flag = true;
  global.doublejump_flag = false;
  next_state = scr_doublejump;
  return(state_next);
}


//droplet throw
if (keyboard_check(vk_shift) && global.droplet_flag == true)
{
  next_state = scr_droplet;
  return(state_next);
}





//otherwise continue falling

return(state_continue);
