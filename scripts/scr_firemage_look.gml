result = false;

if instance_exists(obj_mushroomman)
{
  dist = distance_to_object(obj_mushroomman);
  sight_blocked = collision_line(x, y, obj_mushroomman.x, obj_mushroomman.y, obj_collision, true, false);

  if (dist < MAX_SEE_DIST && !sight_blocked)
  {
    if (obj_mushroomman.x < x)
    {
      direction = 180;
    }
    else
    {
      direction = 0;
    }
    result = true; 
  }
}

return result;
