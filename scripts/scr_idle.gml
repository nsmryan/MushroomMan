if (global.mushroomman_debug)show_debug_message("mushroomman: idle");
vspeed += 2;
idle_counter = 0;

//gravity
if place_free(x, y + 2)
{
  vspeed += 2;
}
    
idle_number = random(100);

//animation
if state_time == 1
{
  if (idle_number > 60)
  {
    sprite_index = spr_mushroom_idle2;
    image_speed = .3
  }
  else if (idle_number < 40)
  {
    sprite_index = spr_mushroom_idle3;
    image_speed = .45
  }
  else 
  {
    next_state = scr_created;
    return(state_next);
  }
}



//return when animation is over
if (state_time>150) && idle_number<40
{
  next_state = scr_created;
  return(state_next);
}

if (state_time>39) && idle_number>60
{
  next_state = scr_created;
  return(state_next);
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

/*
if (keyboard_check_pressed(vk_space))
{
  next_state = scr_fireball;
  return(state_next);
}
*/

//jump brings to falling state
if (keyboard_check(vk_up) && !place_free(x,y+3))
{
  y -= 3;
  vspeed -= 5;
  next_state = scr_jumping;
  return(state_next);
}

//if there is nothing beneath the shroom, go to falling state
off_end_left_low  = !position_meeting(x,                    y + sprite_height,     obj_collision)
off_end_mid       = !position_meeting(x + (sprite_width/2), y + (sprite_height/2), obj_collision)
off_end_right_low = !position_meeting(x + sprite_width,     y + sprite_height,     obj_collision) 

if (off_end_left_low && off_end_mid && off_end_right_low)
{
  next_state = scr_falling;
  return(state_next);
}


global.idle_number = random(2);
idle_flag = random(30);

if ((idle_flag==25) && (keyboard_check(vk_nokey)))
{
  next_state=scr_idle;
  return(state_next);
}


//droplet throw
if (keyboard_check(vk_shift) && global.droplet_flag==true)
{
  next_state = scr_droplet;
  return(state_next);
}


//check for sliding
if (hspeed > 0 && !keyboard_check(vk_right) && global.droplet_flag == false)
{
  sprite_index = spr_mushroom_sliding;
}

if (hspeed < 0 && !keyboard_check(vk_left) && global.droplet_flag == false)
{
  sprite_index = spr_mushroom_sliding_reverse;
}

  //check for sliding, with droplet
if (hspeed > 0 && !keyboard_check(vk_right) && global.droplet_flag == true)
{
  sprite_index = spr_mushroom_sliding_droplet;
}

if (hspeed < 0 && !keyboard_check(vk_left) && global.droplet_flag == true)
{
  sprite_index = spr_mushroom_sliding_droplet_reverse;
}
  

//check for droplet flag
if global.droplet_flag == true
{
  sprite_index = spr_mushroomman_droplet;
}
  
//check for contact with water
if !place_free(x, y) == true
{
  global.droplet_flag = true;
}


if !place_free(x, y) == true
{
  global.droplet_flag = true;
}


return(state_continue);
