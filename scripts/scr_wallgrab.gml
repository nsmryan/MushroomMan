if (global.mushroomman_debug)show_debug_message("mushroomman: wallgrab");

global.doublejump_flag = true;


/*
if place_free(x+2, y-4) && global.object_direction == 0
{
  next_state=scr_falling;
  return(state_next);
}

if place_free(x-2, y-4) && global.object_direction == 180
{
  next_state=scr_falling;
  return(state_next);
}
*/

//from jump situation

if  fromjump_flag==true && state_time < 5 && vspeed > 15
{
  vspeed-=3;
}


if  fromjump_flag==true && state_time < 4  && vspeed <= 15
{
  vspeed-=2;
}


global.wallgrab_flag=false;
global.onwall_flag=true;

if (keyboard_check_pressed(vk_space))
{
  fromjump_flag=false;
  next_state=scr_wallgrab_fireball;
  return(state_next);
}

if place_meeting(x,y+vspeed+1, obj_collision)
{
  fromjump_flag=false;
  global.wallslide_flag = false;
  next_state=scr_created;
  return(state_next);
}



if !place_meeting(x+5,y+1, obj_collision) && global.object_direction==0 && !place_meeting(x+5, y, obj_collision)
{
  global.onwall_flag=false;
  fromjump_flag=false;
  global.wallslide_flag = false;
  next_state=scr_falling;
  return(state_next)
}

if !place_meeting(x-5,y+1, obj_collision) && global.object_direction==180 && !place_meeting(x-5, y, obj_collision)
{
  global.onwall_flag=false;
  fromjump_flag=false;
  global.wallslide_flag = false;
  next_state=scr_falling;
  return(state_next)
}

if global.droplet_flag==true && global.object_direction==0
  {
    sprite_index=spr_mushroom_wallgrab_droplet;
  }
if global.droplet_flag==false && global.object_direction==0
  {  
    sprite_index=spr_mushroom_wallgrab;
  }
if global.droplet_flag==true && global.object_direction==180
  {
    sprite_index=spr_mushroom_wallgrab_droplet_reverse;
  }
if global.droplet_flag==false && global.object_direction==180
  { 
    sprite_index=spr_mushroom_wallgrab_reverse;
  }

//movements checks
vspeed+=1;

if vspeed==0
{
  y-=1;
}

if (vspeed >= 5) vspeed = 5;

if (vspeed <= -5) vspeed = -5;

//jump brings to falling state
/*
if (keyboard_check_pressed(vk_up) && global.object_direction==0) 
{
  y-=3;
  hspeed-=5;
  vspeed-=5;
  global.onwall_flag=false;
  next_state = scr_jumping;
  return(state_next);
}
if (keyboard_check_pressed(vk_up) && global.object_direction==180) 
{
  y-=3;
  hspeed+=5;
  vspeed-=5;
  global.onwall_flag=false;
  next_state = scr_jumping;
  return(state_next);
}
*/

//check keyboard inputs

// offwall jumping state if up is pressed
if (keyboard_check_pressed(vk_up) && global.object_direction==0)  
{
  x-=3;
  hspeed-=5;
  y-=3;
  global.offwalltotheleft_flag=true;
  fromjump_flag=false;
  global.wallslide_flag = false;
  next_state = scr_offwall;
  return(state_next);
}

if (keyboard_check(vk_up) && global.object_direction==180)
{ 
  x+=3;
  hspeed+=5;
  y-=3;
  global.offwalltotheright_flag=true;
  fromjump_flag=false;
  global.wallslide_flag = false;
  next_state = scr_offwall;
  return(state_next);
}

//fall if right or left is pressed
if (keyboard_check(vk_left) && global.object_direction==0)
{ 
  hspeed-=6;
  x-=2;
  global.doublejump_flag = true;
  fromjump_flag=false;
  global.wallslide_flag = false;
  next_state = scr_falling;
  return(state_next);
}

if (keyboard_check(vk_right) && global.object_direction==180)
{ 
  hspeed+=6;
  x+=2;
  global.doublejump_flag = true;
  fromjump_flag=false;
  global.wallslide_flag = false;
  next_state = scr_falling;
  return(state_next);
}







return(state_continue);




