if (global.frog_debug)show_debug_message("frog: resting");

vspeed += 2;
hspeed = 0;
if (frog_direction==-1) sprite_index = spr_frog_restingleft;
else
{
sprite_index = spr_frog_restingright;
}

frogleap = random(100);

if (frogleap < 1)
{
  y-=5;
  change_direction=random(100)
  if (change_direction<25) frog_direction*=-1;
  next_state=scr_frog_leaping
  return(state_nextnow)
}
if (frogleap < 1.1)
{
  frog_direction = frog_direction*-1;
}

return(state_continue)

