


for (w = 0; w < width; w += 1)
{
  for (h = 0;  h < height; h += 1)
  {
    xPos = ds_grid_get(xGrid, w, h);
    yPos = ds_grid_get(yGrid, w, h);
    dist = abs(point_distance(x, y, xPos, yPos));
    
    ds_grid_set(xGrid, w, h, xPos - sign(dist) * coherantForce);
    ds_grid_set(yGrid, w, h, yPos + sign(dist) * coherantForce);
  }  
}
