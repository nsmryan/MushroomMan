


for (w = 0; w < swarm.width; w += 1)
{
  for (h = 0;  h < swarm.height; h += 1)
  {
    if (((w * swarm.height) + h) > swarm.numInds)break;
    xPos = ds_grid_get(swarm.xGrid, w, h);
    yPos = ds_grid_get(swarm.yGrid, w, h);
    dist = abs(point_distance(x, y, xPos, yPos));
    hVel =  ds_grid_get(swarm.hspeedGrid, w, h);
    vVel =  ds_grid_get(swarm.vspeedGrid, w, h);

    ds_grid_set(swarm.hspeedGrid, w, h, sign(x - xPos) * swarm.coherantForce);
    ds_grid_set(swarm.vspeedGrid, w, h, sign(y - yPos) * swarm.coherantForce);
  }  
}

