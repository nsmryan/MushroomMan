if (global.firearms_debug)show_debug_message("firearms: waiting");

hspeed = 0;
vspeed = 0;

if ((firearms_direction == 0) && (blackened == false))
{
  sprite_index=spr_firearms_waiting;
}
else if firearms_direction==0 && blackened==true
{  
    sprite_index=spr_firearms_waiting_blackened;
}

if firearms_direction==180 && blackened==false
{
  sprite_index=spr_firearms_waiting_reverse;
}
else if firearms_direction==180 && blackened==false
{  
    sprite_index=spr_firearms_waiting_blackened_reverse;
}



if instance_exists(obj_mushroomman)
{
if  (obj_mushroomman.y >= y) && (obj_mushroomman.y <= y+96) && (obj_mushroomman.x > x) && firearms_direction == 180
{
  firearms_direction=0;
  x+=5;
  next_state=scr_firearms_running;
  return(state_next);
}

if (obj_mushroomman.y >= y) && (obj_mushroomman.y <= y+96) && (obj_mushroomman.x < x) && firearms_direction == 0
{
  x-=5;
  firearms_direction=180;
  next_state=scr_firearms_running;
  return(state_next);
}
}

return(state_continue);
