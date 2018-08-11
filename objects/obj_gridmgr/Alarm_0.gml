audio_play_sound(snd_doorbell, 1, false);

if (ds_grid_get(grid, x/32, y/16) == 0) {
	instance_create_depth(x, y, 1, obj_box_1x1);
} else {
	
}

alarm[0] = 900;