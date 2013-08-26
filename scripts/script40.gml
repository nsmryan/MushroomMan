//arugment0 main sprite
//argument1 transition prob

main_sprite = argument0;
idle_sprites[0] = 0;
numIdleSprites = 0;
current_sprite = main_sprite;
anim_step = 0;

idle_animation_max_steps = argument1;
transition_step = random(idle_animation_max_steps);

