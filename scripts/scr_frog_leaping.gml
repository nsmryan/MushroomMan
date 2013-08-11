if (global.frog_debug)show_debug_message("frog: leaping");

if (frog_direction == -1) 
{
  sprite_index = spr_frog_leapingleft;
}
else
{
  sprite_index = spr_frog_leapingright
}

if (!place_free(x-1,y) && frog_direction==-1)
{
  frog_direction *= -1;
}

if (!place_free(x+1,y) && frog_direction==1)
{
  frog_direction *= -1;
}

if (!place_free(x, y+1))
{
  next_state = scr_frog_resting;
  return(state_next);
}
else if (state_time < 5)
{
  hspeed += frog_direction * 2;
  vspeed -= 3;
}
else
{
  vspeed += 2;
}

return(state_continue);
