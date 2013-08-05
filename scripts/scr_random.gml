for (w = 0; w < swarm.width; w += 1)
{
  for (h = 0;  h < swarm.height; h += 1)
  {  
    if (((w * swarm.height) + h) >= swarm.numInds)break;
    vVel = ds_grid_get(swarm.vspeedGrid, w, h);
    hVel = ds_grid_get(swarm.hspeedGrid, w, h);
    
    dir = degtorad(random(360));
    
    vVel += swarm.randomForce * sin(dir);
    hVel += swarm.randomForce * cos(dir);  
    
    ds_grid_set(swarm.vspeedGrid, w, h, vVel);
    ds_grid_set(swarm.hspeedGrid, w, h, hVel);
  }  
}
