
for (w = 0; w < width; w += 1)
{
  for (h = 0;  h < height; h += 1)
  {  
    vel = ds_grid_get(velGrid, w, h);
    dir = ds_grid_get(orientGrid, w, h);
    vel += randomForce * ((2 * random(1)) - 1);
    dir += randomForce * ((2 * random(1)) - 1);  
    ds_grid_set(velGrid, w, h, vel);
    ds_grid_set(dirGrid, w, h, dir);
  }  
}
