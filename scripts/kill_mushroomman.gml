MAX_INITIAL_SPEED = 0.1;
spores_spawned = 0;

sprite_index = spr_mushroomman;

for (i = 0; (i < global.NUM_SPORES * 10) && (spores_spawned < global.NUM_SPORES); i += 1)
{
  xPos = x + random_range(0, 45);
  yPos = y + random_range(0, 45);
  
  if (collision_point(xPos, yPos, obj_mushroomman, true, false))
  {
    spore = instance_create(xPos, yPos, obj_spore)
    spore.hspeed = random(MAX_INITIAL_SPEED) * sign((2 * random(1)) - 1); 
    spore.vspeed = random(MAX_INITIAL_SPEED) * sign((2 * random(1)) - 1);
    global.spores[spores_spawned] = spore;
    spores_spawned += 1;
  }   
}

//show_debug_message("created " + string(spores_spawned) + " spores");

for (i = spores_spawned; i < global.NUM_SPORES; i++)
{

  xPos = x + random_range(0, 45);
  yPos = y + random_range(0, 45);
  spore = instance_create(xPos, yPos, obj_spore)
  spore.hspeed = random(MAX_INITIAL_SPEED) * sign((2 * random(1)) - 1); 
  spore.vspeed = random(MAX_INITIAL_SPEED) * sign((2 * random(1)) - 1);
  global.spores[i] = spore;
}

for (i = 0; i < global.NUM_SPORES; i++)
{
  global.spores[i].x -= 15;
  global.spores[i].y -= 15;
}

dying = instance_create(x, y, obj_dying);

instance_destroy();
