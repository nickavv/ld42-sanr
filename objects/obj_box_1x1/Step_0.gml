event_inherited();

if ((keyboard_check_pressed(ord("A")) && !open) &&
	(place_meeting(x, y+1, obj_nick) ||
	 place_meeting(x, y-1, obj_nick) ||
	 place_meeting(x-1, y, obj_nick) ||
	 place_meeting(x+1, y, obj_nick))
	) {
	open = true;
	if (ds_grid_get(obj_gridmgr.grid, gridX + 1, gridY) == 0) {
		instance_create_depth(x + 32, y, depth, contents);
	} else if (ds_grid_get(obj_gridmgr.grid, gridX - 1, gridY) == 0) {
		instance_create_depth(x - 32, y, depth, contents);
	} else if (ds_grid_get(obj_gridmgr.grid, gridX, gridY + 1) == 0) {
		instance_create_depth(x, y + 32, depth + 1, contents);
	} else if (ds_grid_get(obj_gridmgr.grid, gridX, gridY - 1) == 0) {
		instance_create_depth(x, y - 32, depth - 1, contents);
	} else {
		open = false;
	}
}

if (open && sprite_index == spr_box_1x1_closed) {
	sprite_index = spr_box_1x1_open;	
}