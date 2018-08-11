event_inherited();

if (y < targetY) {
	y += 2;
} else if (y > targetY) {
	y -= 2;
} else if (x < targetX) {
	x += 2;
} else if (x > targetX) {
	x -= 2;
}

var oldGridX = gridX;
var oldGridY = gridY;

if (place_meeting(x, y - 1, obj_nick) && keyboard_check(vk_down)) {
	pushDTimer += 1;
} else {
	pushDTimer = 0;
}
if (pushDTimer > startPushingFrames) {
	pushDTimer = 0;
	if (ds_grid_get(obj_gridmgr.grid, gridX, gridY + 1) == 0) {
		targetY = targetY + 16;
		gridY += 1;
	}
}
if (place_meeting(x, y + 1, obj_nick) && keyboard_check(vk_up)) {
	pushUTimer += 1;
} else {
	pushUTimer = 0;
}
if (pushUTimer > startPushingFrames) {
	pushUTimer = 0;
	if (ds_grid_get(obj_gridmgr.grid, gridX, gridY - 1) == 0) {
		targetY = targetY - 16;
		gridY -= 1;
	}
}
if (place_meeting(x - 1, y, obj_nick) && keyboard_check(vk_right)) {
	pushRTimer += 1;
} else {
	pushRTimer = 0;
}
if (pushRTimer > startPushingFrames) {
	pushRTimer = 0;
	if (ds_grid_get(obj_gridmgr.grid, gridX + 1, gridY) == 0) {
		targetX = targetX + 32;
		gridX += 1;
	}
}
if (place_meeting(x + 1, y, obj_nick) && keyboard_check(vk_left)) {
	pushLTimer += 1;
} else {
	pushLTimer = 0;
}
if (pushLTimer > startPushingFrames) {
	pushLTimer = 0;
	if (ds_grid_get(obj_gridmgr.grid, gridX - 1, gridY) == 0) {
		targetX = targetX - 32;
		gridX -= 1;
	}
}

ds_grid_set(obj_gridmgr.grid, gridX, gridY, 1);
if (oldGridX != gridX || oldGridY != gridY) {
	ds_grid_set(obj_gridmgr.grid, oldGridX, oldGridY, 0);
}