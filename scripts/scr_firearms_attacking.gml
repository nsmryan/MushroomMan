if (global.firearms_debug)show_debug_message("firearms: attacking");

if (firearms_direction == 0) && !blackened
{
  sprite_index = spr_firearms_attack;
  hspeed += 8;
}
else if (firearms_direction == 0) && blackened
{
  sprite_index=spr_firearms_attack_blackened;
  hspeed+=8;
} 


else if  (firearms_direction == 180) && !blackened
{
  sprite_index = spr_firearms_attack_reverse;
  hspeed -= 8;
}
else if (firearms_direction == 180) && blackened
{
  sprite_index = spr_firearms_attack_blackened_reverse;
  hspeed += 8;
}



if state_time > 15
{
  next_state = scr_firearms_idle;
  return(state_next);
}

return(state_continue);
