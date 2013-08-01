for (w = 0; w < swarm.width; w += 1)
{
  for (h = 0;  h < swarm.height; h += 1)
  {
    if (((w * swarm.height) + h) > swarm.numInds)break;
    xPos = ds_grid_get(swarm.xGrid, w, h);
    yPos = ds_grid_get(swarm.yGrid, w, h);
    dist = abs(point_distance(x, y, xPos, yPos));
    if (abs(dist) > swarm.radius)
    {
      scaling = dist - swarm.radius;
      xPart = (x - xPos) / dist;
      yPart = (y - yPos) / dist;
      ds_grid_set(swarm.xGrid, w, h, xPos + xPart * scaling);
      ds_grid_set(swarm.yGrid, w, h, yPos + yPart * scaling);
    }
  }  
}
