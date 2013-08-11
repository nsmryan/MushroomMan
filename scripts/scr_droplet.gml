if (global.mushroomman_debug)show_debug_message("mushroomman: droplet");

if (global.object_direction == 0)
{
  sprite_index = spr_mushroom_droplet_cocked;
}
else
{
  sprite_index = spr_mushroom_droplet_cocked_reverse;
}

vspeed += 2;

if (keyboard_check_released(vk_shift))
{
  global.thrown = true;
  global.droplet_flag = false;
  sprite_index = spr_mushroom_droplet_throw_reverse;

  xPos = x;
  
  droplet = instance_create(xPos, y, obj_waterdroplet);

  with (droplet)
  {
    dir = 1;
    if (global.object_direction == 180)
    {
      dir = -1;
    }
    physics_apply_impulse(x, y, dir * 3, -4);
    //physics_apply_local_force(0, 0, dir * 3, -4);
  }
  next_state = scr_falling;
  return state_next;
}

//check keyboard inputs
if (keyboard_check(vk_left))  
{
  x -= 4;
  global.object_direction = 180;
  sprite_index = spr_mushroom_falling_reverse;
}

if (keyboard_check(vk_right)) 
{
  global.object_direction = 0;
  x += 4;
  sprite_index = spr_mushroom_falling;
}

if (keyboard_check(vk_up)) 
{
  y -= 3;
  vspeed -= 5;
}

//movements checks
if (hspeed >= 8) hspeed = 8;
if (vspeed >= 15) vspeed = 15;
if (hspeed <= -8) hspeed = -8;
if (vspeed <= -15) vspeed = -15;

return (state_continue);
