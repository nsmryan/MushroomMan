if (global.firearms_debug)show_debug_message("firearms: idle");


if (!blackened)
{
  sprite_index = spr_firearms_idle;
  image_speed = 0.1
}
else if (blackened)
{
  sprite_index = spr_firearms_idle_blackened;
  image_speed = 0.1;
}

//line of sight
if (scr_firearms_look())
{
  next_state = scr_firearms_running;
  return(state_next);
}

return (state_continue);
