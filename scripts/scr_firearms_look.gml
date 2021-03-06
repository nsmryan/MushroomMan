result = false;

if instance_exists(obj_mushroomman)
{
  dist = distance_to_object(obj_mushroomman);
  withinHeight = place_meeting(obj_mushroomman.x, y, obj_mushroomman);
  sight_blocked = collision_line(x, y, obj_mushroomman.x, obj_mushroomman.y, obj_collision, true, false);

  if (dist < MAX_SEE_DIST && withinHeight && !sight_blocked)
  {
    if (obj_mushroomman.x < x)
    {
      firearms_direction = 180;
    }
    else
    {
      firearms_direction = 0;
    }
    result = true; 
  }
}

return result;
