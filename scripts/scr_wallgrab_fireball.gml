if (global.mushroomman_debug)show_debug_message("mushroomman: wallgrab_fireball");

vspeed+=.5;
global.wallgrab_flag=true;
  
if (global.object_direction==0)
{
  sprite_index=spr_mushroom_wallgrab_fireball;

}

if (keyboard_check_pressed(vk_space) && global.object_direction==180)
{
  sprite_index=spr_mushroom_wallgrab_fireball_reverse;
}

if vspeed>=5
{
vspeed=5;
}

if (state_time == 3) 
{
  instance_create(x, y, obj_fireball);
  next_state=scr_wallgrab;
  return(state_next);
}

return (state_continue);
