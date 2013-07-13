if (global.mushroomman_debug)show_debug_message("mushroomman: created");

//gravity
if place_free(x, y+2)
{
  vspeed += 2;    
}

sprite_index = spr_mushroomman;


//check for droplet flag
if (global.droplet_flag == true)
{
  sprite_index = spr_mushroomman_droplet;
}
  
//check for contact with water
if (place_meeting(x,y, obj_water_surface) or (place_meeting(x,y, obj_water)))
{
global.droplet_flag=true;
}

//check keyboard inputs
if (keyboard_check(vk_left))  
{
  global.object_direction=180;
  next_state = scr_running;
  return(state_next);
}

if (keyboard_check(vk_right)) 
{
  global.object_direction=0;
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
if (keyboard_check_pressed(vk_up) && !place_free(x,y+3))
{
  y-=3;
  vspeed-=5;
  next_state = scr_jumping;
  return(state_next);
}

//if there is nothing beneath the shroom, go to falling state
if (place_free(x, y + 3))
{
  global.doublejump_flag = true;
  next_state = scr_falling;
  return(state_next);
}





//droplet throw
if (keyboard_check(vk_shift) && global.droplet_flag==true)
{
  next_state=scr_droplet;
  return(state_next);
}

  //check for sliding, with droplet
if (hspeed>0 && !keyboard_check(vk_right) && global.droplet_flag==true)
{
  sprite_index=spr_mushroom_sliding_droplet;
}

if (hspeed<0 && !keyboard_check(vk_left) && global.droplet_flag==true)
{
  sprite_index=spr_mushroom_sliding_droplet_reverse;
}

//check for sliding
if (hspeed>0 && !keyboard_check(vk_right) && global.droplet_flag==false)
{
  sprite_index=spr_mushroom_sliding;
}

if (hspeed<0 && !keyboard_check(vk_left) && global.droplet_flag==false)
{
  sprite_index=spr_mushroom_sliding_reverse;
}


  





//idle situation
if keyboard_check(vk_anykey)
{
  idle_counter=0;
}
else
{
  idle_counter+=1;
}

if idle_counter > 500
{
  next_state= scr_idle;
  return (state_next);
}

return(state_continue);
