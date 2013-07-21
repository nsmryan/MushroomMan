if (global.debug_firemage)show_debug_message("firemage: attacking");

if ((state_time == 0) && instance_exists(obj_mushroomman))
{
  instance_create(x, y, obj_firemage_fireball);
}

if (state_time > ATTACKING_TIME)
{
  next_state = scr_firemage_teleporting;
  return state_next;
}

return state_continue;
