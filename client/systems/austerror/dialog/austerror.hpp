#define rt_rnframe_idc 3660
#define rt_rnbutton_idc 3661
#define rt_rnedit_idc 3662

class RenameTent
{
  idd = -1;
  movingEnable = true;
  controlsBackground[] = { RN_BACKGROUND, RN_FRAME };
  class RN_BACKGROUND : RscText
  {
     colorBackground[] = {0.4, 0.4, 0.4, 0.75};
     text = ;
     x = 0.2;
     y = 0.1;
     w = 0.5;
     h = 0.3;
  };
  class RN_FRAME : RscText
  {
  	 idc = rt_rnframe_idc;
  	 style = ST_FRAME;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
     text = "Tent Name";
     font = "PuristaMedium";
     sizeEx = 0.025;
     x = 0.22;
     y = 0.12;
     w = 0.46;
     h = 0.26;
  };
  objects[] = { };
  controls[] = { RN_BUTTON, RN_EDIT };
  class RN_BUTTON : RscButton
  {
  	idc = rt_rnbutton_idc;
  	x = 0.35;
  	y = 0.30;
  	w = 0.2;
  	h = 0.04;
  	text = "Done";
  	action = execVM "client\systems\austerror\finish.sqf";
  };
  class RN_EDIT : RscEdit
  {
  	idc = rt_rnedit_idc;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
  	x = 0.25;
  	y = 0.18;
  	w = 0.4;
  	h = 0.04;
  };
};