if (global.mushroomman_debug)show_debug_message("mushroomman: running");

vspeed += 2;

if (place_free(x, y + 3))
{
  global.doublejump_flag = true;
  next_state = scr_falling;
  return(state_next);
}

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
if (!place_free(x + 5, y) && (global.object_direction == 0) && place_free(x, y + 3))
{
  move_contact_solid(0, 5);
  vspeed = 0;
  hspeed = 0;
  next_state = scr_wallgrab;
  return(state_next);
}

if (!place_free(x -5, y) && (global.object_direction == 180) && place_free(x, y + 1))
{
  move_contact_solid(180, 5);
  vspeed = 0;
  hspeed = 0;
  next_state = scr_wallgrab;
  return(state_next);
}

if ((!keyboard_check(vk_left)) && (!keyboard_check(vk_right)))
{
  next_state = scr_created;
  return(state_next);
}

/* Slopes */
max_slope = 50;

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
  show_debug_message("x = " + string(x) + ", y = " + string(y));
}



/*
if (keyboard_check_pressed(vk_space))
{
  next_state = scr_fireball;
  return(state_next);
}
*/
   
/*
if !place_meeting(x+hspeed, y+5, obj_collision) && !(hspeed==0)  && place_meeting(x+hspeed, y+6, obj_collision)  //if you're moving down a slope
{
  if place_meeting(x, y+3, obj_collision)      //if you're on the ground
  {
    y += 5;                   //move down the slope
  }
}
else if place_free(x+hspeed, y-5) && !(hspeed==0)           //if you're not next to a wall
{
  y -= 5;
}
*/


/*
if place_free(x+hspeed, y-5) && !(hspeed==0)  //check if you're next to a slope
{
  y -= 5;                     //move up slope
}

if place_meeting(x+hspeed, y-5, obj_collision) && !(hspeed==0)  && !place_meeting(x+hspeed, y-6, obj_collision)  //if you're moving down a slope
{
  if place_meeting(x, y+3, obj_collision)      //if you're on the ground
  {
    y -= 5;                   //move down the slope
  }
}
*/

return(state_continue);











