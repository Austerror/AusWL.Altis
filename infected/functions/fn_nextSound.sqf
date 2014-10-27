private ["_zombie", "_type", "_target"];

if (isNil "counterSoundIdle") then {
	counterSoundIdle = 1;
	counterSoundPunch = 1;
	counterSoundHurt = 1;
};
_zombie = _this select 0;
_type = _this select 1;
//_target = _this select 2;
if (_type == "idle") then {
	//[_zombie,_target] say3D ("zidle" + str(counterSoundIdle));
	_zombie say3D ("zidle" + str(counterSoundIdle));
	if (counterSoundIdle == 5) then {
		counterSoundIdle = 1;
	} else {
		counterSoundIdle = counterSoundIdle + 1;
	};
};
if (_type == "hurt") then {
	//[_zombie,_target] say3D ("zhurt" + str(counterSoundHurt));
	_zombie say3D ("zhurt" + str(counterSoundHurt));
	if (counterSoundHurt == 3) then {
		counterSoundHurt = 1;
	} else {
		counterSoundHurt = counterSoundHurt + 1;
	};
};
if (_type == "punch") then {
	//[_zombie,_target] say3D ("zpunch" + str(counterSoundPunch));
	_zombie say3D ("zpunch" + str(counterSoundPunch));
	if (counterSoundPunch == 4) then {
		counterSoundPunch = 1;
	} else {
		counterSoundPunch = counterSoundPunch + 1;
	};
};