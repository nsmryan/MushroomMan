if (global.firearms_debug)show_debug_message("firearms: running");

//go to the waiting state
if place_meeting(x+1,y,obj_platformend)
{
  firearms_direction=0;
  next_state=scr_firearms_waiting;
  return(state_next);
}

if place_meeting(x-1,y,obj_platformend)
{
  firearms_direction=180;
  next_state=scr_firearms_waiting;
  return(state_next);
}


//sprite
if instance_exists(obj_mushroomman)
{
if firearms_direction==180 && blackened==false
{
sprite_index = spr_firearms_running_reverse;
image_speed=.3;
hspeed-=2;
}
else if firearms_direction==180 && blackened==true
{
  sprite_index = spr_firearms_running_blackened_reverse;
  image_speed=.3;
  hspeed-=2;
}

if firearms_direction==0 && blackened==false
{
sprite_index = spr_firearms_running;
image_speed=.3;
hspeed+=2;
}
else if firearms_direction==0 && blackened==true
{
  sprite_index = spr_firearms_running_blackened;
  image_speed=.3;
  hspeed+=2;
}
}

if instance_exists(obj_mushroomman)
{
totheleft=instance_exists(obj_mushroomman) && (obj_mushroomman.y >= y) && (obj_mushroomman.y <= y+96) && (obj_mushroomman.x < x)
totheright=instance_exists(obj_mushroomman) && (obj_mushroomman.y >= y) && (obj_mushroomman.y <= y+96) && (obj_mushroomman.x > x) 
}


if totheright==false && totheleft==false
{
 next_state = scr_firearms_sniffing;
 return(state_next);
}

if !instance_exists(obj_mushroomman)
{
 next_state = scr_firearms_sniffing;
 return(state_next);
}
 
if place_meeting(x+50, y, obj_mushroomman)
{
  firearms_direction=0;
  next_state=scr_firearms_attacking;
  return(state_next);
} 

if place_meeting(x-50, y, obj_mushroomman)
{
  firearms_direction=180;
  next_state=scr_firearms_attacking;
  return(state_next);
} 




return(state_continue);

