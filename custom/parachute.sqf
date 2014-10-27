// Parachute Script
// Author: Austerror
// Arguments Position [x,y,z]

private ["_playerVehicle"];

_playerVehicle = vehicle player;
player action ["getOut", _playerVehicle];

waitUntil {vehicle player == player};

chute = "Steerable_Parachute_F" createVehicle [0,0,0]; 
chute setPos [(getPos player select 0) - 5, (getPos player select 1) - 5, (getPos player select 2) - 5];
player moveIndriver chute;
false;