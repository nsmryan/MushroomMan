if (global.mushroomman_debug)show_debug_message("mushroomman: offwall");

if (global.object_direction == 180)
{
  sprite_index = spr_mushroom_jumping_reverse;
  
}

if (global.object_direction == 0)
{
  sprite_index = spr_mushroom_jumping;
}

if (hspeed < 0)
{
  sprite_index = spr_mushroom_jumping_reverse;
}

if (hspeed > 0)
{
  sprite_index = spr_mushroom_jumping;
}



if global.offwalltotheleft_flag && state_time < 3
{
  vspeed -= 4;
  hspeed -= 1;
}

if global.offwalltotheleft_flag && (state_time > 3)
{
  vspeed -= 2;
  hspeed += 1;
}


if global.offwalltotheright_flag && (state_time < 3)
{
  vspeed-=4;
  hspeed+=1;
}

if global.offwalltotheright_flag && (state_time > 3)
{
  vspeed-=2;
  hspeed-=1;
}

if (state_time == 7)
{
  global.offwalltotheleft_flag = false;
  global.offwalltotheright_flag = false;
  next_state = scr_falling;
  return(state_next);

}

if (keyboard_check(vk_left) && state_time < 3)
{
//  hspeed -= 1;
  y -= 2;
  global.object_direction = 180;
}

if (keyboard_check(vk_left) && state_time > 3)
{
  hspeed -= 1;
  y -= 2;
  global.object_direction = 180;
}

if (keyboard_check(vk_right && state_time < 3)) 
{
  y -= 2;
  global.object_direction = 0;
//  hspeed += 3;
}

if (keyboard_check(vk_right && state_time > 3)) 
{
  y -= 2;
  global.object_direction = 0;
  hspeed += 1;
}

//movements checks
if (hspeed >= 8) hspeed = 8;
if (vspeed >= 15) vspeed = 15;
if (hspeed <= -8) hspeed = -8;
if (vspeed <= -15) vspeed = -15;


return(state_continue)
