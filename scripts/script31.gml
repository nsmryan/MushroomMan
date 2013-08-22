xPos = arg0;
yPos = arg1;
radius = arg2;
numInds = arg3;
maxVel = arg4;

length = floor(sqrt(numInds));
if ((length * length) != numInds)length += 1;

width = length;
height = length;
swarm = instance_create(xPos, yPos, obj_swarm);

swarm.xGrid = ds_grid_create(width, height);
swarm.yGrid = ds_grid_create(width, height);
swarm.velGrid = ds_grid_create(width, height);
swarm.orientGrid = ds_grid_create(width, height);
swarm.maxVel = maxVel;
swarm.numInds = numInds;

for (w = 0; w < width; w += 1)
{
  for (h = 0; h < height; h += 1)
  {
    if ((w * length) + height > numInds)break;
    dist = random(radius);
    dir = random(360);
    ds_grid_set(swarm.xPos,       w, h, dist * sin(dir));
    ds_grid_set(swarm.yPos,       w, h, dist * cos(dir));
    ds_grid_set(swarm.orientGrid, w, h, dir);
    ds_grid_set(swarm.velGrid,    w, h, random(maxVel));
  }
}


return swarm;
