radius = argument0;
numInds = argument1;
maxVel = argument2;
indObj = argument3;

length = floor(sqrt(numInds));
if ((length * length) != numInds)length += 1;

swarm = instance_create(x, y, obj_swarm);

width = length;
height = length;

swarm.width = width;
swarm.height = height;
swarm.radius = radius;
swarm.xGrid = ds_grid_create(width, height);
swarm.yGrid = ds_grid_create(width, height);
swarm.hspeedGrid = ds_grid_create(width, height);
swarm.vspeedGrid = ds_grid_create(width, height);
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
    dirInRadians = degtorad(random(360));
    xPos = x + (dist * sin(dirInRadians));
    yPos = y + (dist * cos(dirInRadians));
    ds_grid_set(swarm.xGrid,      w, h, xPos);
    ds_grid_set(swarm.yGrid,      w, h, yPos);
    ds_grid_set(swarm.hspeedGrid, w, h, sin(dirInRadians) * random(maxVel));
    ds_grid_set(swarm.vspeedGrid, w, h, cos(dirInRadians) * random(maxVel));
    ind = instance_create(xPos, yPos, indObj);
    ds_grid_set(swarm.indGrid,    w, h, ind);
  }
}

return swarm;