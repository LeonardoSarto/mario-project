key_left = keyboard_check(vk_left)
key_jump = keyboard_check(vk_up)
key_right = keyboard_check(vk_right)
key_down = keyboard_check(vk_down)
var move = key_right - key_left
hsp = move * walksp
vsp = vsp + grv

if (place_meeting(x, y + 1, oFloor) && key_jump) {
	vsp = -7
}

if (place_meeting(x + hsp, y, oFloor)) {
	while(!place_meeting(x + sign(hsp), y, oFloor)) {
		x = x + sign(hsp)	
	}
	
	hsp = 0
}

if (place_meeting(x, y + vsp, oFloor)) {
	while(!place_meeting(x, y + sign(vsp), oFloor)) {
		y = y + sign(vsp)	
	}
	
	vsp = 0
}

x = x + hsp
y = y + vsp

if(keyboard_check(vk_anykey)) {
	if(key_down) {
		sprite_index = sPlayerDuck
	} else if(key_left) {
		image_xscale = 1
		sprite_index = sPlayerWalking
	} else if(key_right) {
		image_xscale = -1
		sprite_index = sPlayerWalking
	}
} else {
	sprite_index = sPlayerIdle	
}

if (!place_meeting(x, y + 1, oFloor)) {
	sprite_index = sPlayerAir
	image_speed = 0
	if(sign(vsp > 0)) image_index = 1
	else image_index = 0
	
}

