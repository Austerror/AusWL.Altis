_StartPos = (_this select 0);
_BlockSize = (_this select 1);
_BlockHeight = (_this select 2);
_BaseDirection = getDir (_this select 3);
_Ghost = (_this select 4);

_NMP_GridPositions = [_StartPos];
_NMP_GridPositions = _NMP_GridPositions + [[_StartPos select 0,_StartPos select 1,(_StartPos select 2)+_BlockHeight]];
_NMP_GridPositions = _NMP_GridPositions + [[_StartPos select 0,_StartPos select 1,(_StartPos select 2)-_BlockHeight]];
{
	_Position = [(_StartPos select 0)+(_BlockSize)*sin(_BaseDirection+_x),(_StartPos select 1)+(_BlockSize)*cos(_BaseDirection+_x),_StartPos select 2];
	_NMP_GridPositions = _NMP_GridPositions + [_Position];
} forEach [0,90,180,270];

//TODO: replace with dynamic code to allow for 3rd person construction!
if (cameraView == "External") then
{
	if ((vehicle player) == player) then
	{
		player switchCamera "Internal";
	};
};

_Head = (positionCameraToWorld [0,0,1]);
if !(surfaceIsWater _Head) then {_Head = ATLToASL _Head};
_EyeCentre = ((getPosASL player select 2) + 1.5);
_Difference = ((_Head select 2)-_EyeCentre);
_Adjust = 0;
if (_Difference < 0) then {_Difference = -_Difference};
if (_Difference > 0.9) then {_Adjust = _Difference - 0.9;_Difference = 0.9};
_Difference = _Difference + _Adjust/2;
_NMP_CrossHairPASL = (positionCameraToWorld [0,0,2-_Difference]);
if !(surfaceIsWater _NMP_CrossHairPASL) then {_NMP_CrossHairPASL = ATLToASL _NMP_CrossHairPASL};
Helper setPosASL _NMP_CrossHairPASL;

_NMP_NearestBlock = [_NMP_GridPositions,_NMP_CrossHairPASL] call BIS_fnc_nearestPosition;

_Ghost setPosASL _NMP_NearestBlock;

_Return = [_NMP_GridPositions,_NMP_NearestBlock];
_Return