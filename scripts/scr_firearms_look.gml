result = false;

if instance_exists(obj_mushroomman)
{
  if  (obj_mushroomman.y >= y) && (obj_mushroomman.y <= y + 96) && (obj_mushroomman.x > x) 
  {
    firearms_direction = 0;
    result = true;
  }

  if (obj_mushroomman.y >= y) && (obj_mushroomman.y <= y+96) && (obj_mushroomman.x < x)
  {
    firearms_direction = 180;
    result = true; 
  }
}

return result;
