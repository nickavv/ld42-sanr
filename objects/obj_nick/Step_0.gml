event_inherited();

var oldGridX = gridX;
var oldGridY = gridY;

if (keyboard_check(vk_down)) {
	if (!place_meeting(x, y+1, obj_solid_parent)) {
		y += moveSpeed;
	}
	sprite_index = spr_nick_move_down;
}
if (keyboard_check(vk_up)) {
	if (!place_meeting(x, y-1, obj_solid_parent)) {
		y -= moveSpeed;
	}
	sprite_index = spr_nick_move_up;
}
if (keyboard_check(vk_left)) {
	if (!place_meeting(x-1, y, obj_solid_parent)) {
		x -= moveSpeed;
	}
	sprite_index = spr_nick_move_left;
}
if (keyboard_check(vk_right)) {
	if (!place_meeting(x+1, y, obj_solid_parent)) {
		x += moveSpeed;
	}
	sprite_index = spr_nick_move_right;
}

if (!keyboard_check(vk_down) && !keyboard_check(vk_up) && !keyboard_check(vk_left) && !keyboard_check(vk_right)) {
	if (sprite_index == spr_nick_move_down)
		sprite_index = spr_nick_down;
	if (sprite_index == spr_nick_move_up)
		sprite_index = spr_nick_up;
	if (sprite_index == spr_nick_move_left)
		sprite_index = spr_nick_left;
	if (sprite_index == spr_nick_move_right)
		sprite_index = spr_nick_right;
}


gridX = x/32;
gridY = y/16;
ds_grid_set(obj_gridmgr.grid, gridX, gridY, 1);
if (oldGridX != gridX || oldGridY != gridY) {
	ds_grid_set(obj_gridmgr.grid, oldGridX, oldGridY, 0);
}