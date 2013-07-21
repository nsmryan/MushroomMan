if (global.debug_firemage)show_debug_message("firemage: teleporting");

if (!instance_exists(obj_mushroomman))
{
  //teleport back to initial position. this should be done more slowly, in a waiting state.
  x = initialPosX;
  y = initialPosY;
  next_state = scr_firemage_idle;
  return state_next;
}

if (!scr_firemage_look())
{
  //teleport back to initial position. this should be done more slowly, in a waiting state.
  x = initialPosX;
  y = initialPosY;
  next_state = scr_firemage_idle;
  return state_next;
}

if (state_time > TELEPORTING_TIME)
{
  next_state = scr_firemage_attacking;
  return state_next;
}

dir = random(360);

dist = random_range(TELEPORT_MIN_DIST, TELEPORT_MAX_DIST);

movePosX = obj_mushroomman.x + sin(degtorad(dir)) * dist;
movePosY = obj_mushroomman.y + cos(degtorad(dir)) * dist;

colliding = place_meeting(movePosX, movePosY, all);
sight_blocked = collision_line(movePosX, movePosY, obj_mushroomman.x, obj_mushroomman.y, obj_collision, true, false);
in_room = movePosX > 0 && movePosX < room_width && movePosY > 0 && movePosY < room_height;

if (!colliding && !sight_blocked && in_room)
{
  x = movePosX;
  y = movePosY;
  next_state = scr_firemage_attacking;
  return state_next;
}

return state_continue;
