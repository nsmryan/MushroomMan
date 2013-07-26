

for (w = 0; w < width; w += 1)
{
  for (h = 0;  h < height; h += 1)
  {
    xPos = ds_grid_get(xGrid, w, h);
    yPos = ds_grid_get(yGrid, w, h);
    dist = abs(point_distance(x, y, xPos, yPos));
    if (abs(dist) > radius)
    {
      scaling = dist - radius;
      xPart = (x - xPos) / dist;
      yPart = (y - yPos) / dist;
      ds_grid_set(xGrid, w, h, xPos + xPart * scaling);
      ds_grid_set(yGrid, w, h, yPos + yPart * scaling);
    }
  }  
}
