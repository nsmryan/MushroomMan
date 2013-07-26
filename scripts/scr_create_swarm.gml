xPos = argument0;
yPos = argument1;
radius = argument2;
numInds = argument3;
maxVel = argument4;
indObj = argument5;

length = floor(sqrt(numInds));
if ((length * length) != numInds)length += 1;

swarm = instance_create(xPos, yPos, obj_swarm);

width = length;
height = length;

swarm.width = length;
swarm.height = length;
swarm.xGrid = ds_grid_create(width, height);
swarm.yGrid = ds_grid_create(width, height);
swarm.velGrid = ds_grid_create(width, height);
swarm.orientGrid = ds_grid_create(width, height);
swarm.indGrid = ds_grid_create(width, height);
swarm.maxVel = maxVel;
swarm.numInds = numInds;
swarm.rules = 0;
swarm.indObj = indObj;

for (w = 0; w < width; w += 1)
{
  for (h = 0; h < height; h += 1)
  {
    if ((w * length) + height > numInds)break;
    dist = random(radius);
    dir = random(360);
    xPos = dist * sin(dir);
    yPos = dist * cos(dir);
    ds_grid_set(swarm.xGrid,      w, h, xPos);
    ds_grid_set(swarm.yGrid,      w, h, yPos);
    ds_grid_set(swarm.orientGrid, w, h, dir);
    ds_grid_set(swarm.velGrid,    w, h, random(maxVel));
    ds_grid_set(swarm.indGrid,    w, h, instance_create(xPos, yPos, indObj));
  }
}


return swarm;
