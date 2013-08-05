for (w = 0; w < swarm.width; w += 1)
{
  for (h = 0;  h < swarm.height; h += 1)
  {
    if (((w * swarm.height) + h) > swarm.numInds)break;
    
    xPos = ds_grid_get(swarm.xGrid, w, h);
    yPos = ds_grid_get(swarm.yGrid, w, h);
    
    ind = ds_grid_get(swarm.indGrid, w, h);
    
    dist = abs(point_distance(x, y, xPos, yPos));
    
    if (dist > swarm.radius)
    {
      scaling = dist - swarm.radius;
      xPart = (x - xPos) / dist;
      yPart = (y - yPos) / dist;
      ind.x = xPos + xPart * scaling;
      ind.y = yPos + yPart * scaling;
      ds_grid_set(swarm.xGrid, w, h, ind.x);
      ds_grid_set(swarm.yGrid, w, h, ind.y);
    }
  }  
}
