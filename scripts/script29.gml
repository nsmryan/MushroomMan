if (global.debug_firemage)show_debug_message("firemage: attacking");

if (instance_exists(obj_mushroomman)
{
  fireball = instance_create(x, y, obj_firemage_fireball);
  fireball.direction = point_direction(x, y, obj_mushroomman.x, obj_mushroomman.y);
}

if (state_time > ATTACKING_TIME)
{
  next_state = scr_firemage_teleporting;
  return state_next;
}

return state_continue;
