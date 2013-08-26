//argument0 transition prob

//must call create with arugments for the tile. this cannot be inherited.

main_sprites[0] = 0;
idle_sprites[0, 0] = 0;
numIdleSprites[0] = 0;
anim_step = 0;
animation_group = 0;

current_sprite = main_sprites[animation_group];

idle_animation_max_steps = 1/argument0;
transition_step = random(idle_animation_max_steps);

