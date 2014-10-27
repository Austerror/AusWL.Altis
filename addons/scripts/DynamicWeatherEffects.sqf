/*
	Breaking Point Arma 3 Public-Alpha Build
	Created By Deathlyrage, Valtiel and Nohrt
	
	Key: e56sya3cvthsb67kelkhnvf6e
	
	Special Thanks To:
	  Nohrt - Project Management / Server Resources
	  Inch - UK 15/16 and Download Mirrors
	  HFBServers - Content Delivery Network and Server Hosting
	  Dwarden - Continued Support and Resources
	
	More Detailed Credits Listed Here:
	     http://breakingpointmod.com/wiki/index.php?title=Credits
	
	Copyright © 2013-2014, Breaking Point (breakingpointmod.com)
						   The Zombie Infection (thezombieinfection.com)
	All rights reserved.
*/

//if(true)exitWith{};
private["_0or","_0pr","_0qr","_0rr","_0sr"];
private["_0tr","_0ur","_0vr","_0wr","_05r","_04r"];
private["_0gs","_0hs","_0xr","_0yr","_0zr","_01r","_02r","_03r","_06r","_07r","_08r","_0is"];
if(isNil "_this")then{
	_this=[];
};
if(count _this>0)then{
	_0or=_this select 0;
}else{
	_0or=-1;
};
if(count _this>1)then{
	_0pr=_this select 1;
}else{
	_0pr=-1;
};
if(count _this>2)then{
	_0qr=_this select 2;
}else{
	_0qr=-1;
};
if(count _this>3)then{
	_0rr=_this select 3;
}else{
	_0rr=[-1,-1];
};
if(count _this>4)then{_0sr=_this select 4;}else{_0sr=false;};_0tr=10;_0ur=20;_0vr=5;_0wr=10;_0xr=0;_0yr=1;_0zr=0;_01r=0.8;_02r=0;_03r=8;_04r=25;_05r=50;_06r=0;_07r=(_0ur+_0wr)/2;_08r=false;bpimf3d3n789=[];bp3eiggvcqir=[];bpw72i1h39b5={private["_09r","_currentFog","_0as","_0bs","_0cs","_0ds","_0es","_0fs"];_09r=_this select 0;_0as=_this select 2;_0bs=_this select 3;_0cs=_this select 4;_0ds=_this select 5;_0es=_this select 6;_0fs=_this select 7;0 setOvercast _09r;bpn22u4ydsxl=_0as;setWind[_0es,_0fs,true];if(_0bs=="OVERCAST")then{_0ds setOvercast _0cs;};};if(!isServer)then{"bpimf3d3n789" addPublicVariableEventHandler{bpimf3d3n789 call bpw72i1h39b5;};waitUntil{!isNil "bpujhwlzfoz9"};bp3eiggvcqir=[true];publicVariableServer "bp3eiggvcqir";};if(isServer)then{bpdmxdhbnelv={private["_0ds","_0bs"];_0ds=bpmaont99vf5-bpfycyxdq6gm;if(_0ds>0)then{_0bs=bpwdrx19fh2h;}else{_0bs="";};bpimf3d3n789=[overcast,fog,bpn22u4ydsxl,_0bs,bp5ycr59hcmt,_0ds,bp2vnqsl3ln8,bpu18qudy4hk];publicVariable "bpimf3d3n789";bpimf3d3n789 call bpw72i1h39b5;};"bp3eiggvcqir" addPublicVariableEventHandler{call bpdmxdhbnelv;};bpwdrx19fh2h="";bp5ycr59hcmt=0;bpfycyxdq6gm=time;bpmaont99vf5=time;bp2vnqsl3ln8=_0rr select 0;bpu18qudy4hk=_0rr select 1;_0or=0;_0gs=0;_0hs=0;if(_0pr==-1)then{_0pr=(_0xr+random(_0yr-_0xr));}else{if(_0pr<_0xr)then{_0pr=_0xr;};if(_0pr>_0yr)then{_0pr=_0yr;};};0 setOvercast _0pr;if(_0pr>=0.75)then{if(_0qr==-1)then{_0qr=(_0zr+random(_0zr-_0zr));}else{if(_0qr<_0zr)then{_0qr=_0zr;};if(_0qr>_01r)then{_0qr=_01r;};};}else{_0qr=0;};bpn22u4ydsxl=_0qr;0 setRain bpn22u4ydsxl;_0is=_02r+random(_03r-_02r);if(bp2vnqsl3ln8==-1)then{if(random 100<50)then{bp2vnqsl3ln8=-_02r-random(_0is-_02r);}else{bp2vnqsl3ln8=_02r+random(_0is-_02r);};};if(bpu18qudy4hk==-1)then{if(random 100<50)then{bpu18qudy4hk=-_02r-random(_0is-_02r);}else{bpu18qudy4hk=_02r+random(_0is-_02r);};};setWind[bp2vnqsl3ln8,bpu18qudy4hk,true];sleep 0.05;publicVariable "bpn22u4ydsxl";bpujhwlzfoz9=true;publicVariable "bpujhwlzfoz9";[_0tr,_0ur,_0vr,_0wr,_0gs,_0hs,_0xr,_0yr,_02r,_03r,_04r,_0sr]spawn{private["_0tr","_0ur","_0vr","_0wr","_0gs","_0hs","_0xr","_0yr","_02r","_03r","_04r","_0sr"];private["_0ls","_0js","_0ks","_0ms","_0os","_0ns"];_0tr=_this select 0;_0ur=_this select 1;_0vr=_this select 2;_0wr=_this select 3;_0gs=_this select 4;_0hs=_this select 5;_0xr=_this select 6;_0yr=_this select 7;_02r=_this select 8;_03r=_this select 9;_04r=_this select 10;_0sr=_this select 11;_0js=2;_0ks=2;while{true}do{sleep floor(_0vr*60+random((_0wr-_0vr)*60));if(_0gs==_0hs&&_0xr!=_0yr)then{_0ls="OVERCAST";};if(_0gs!=_0hs&&_0xr==_0yr)then{_0ls="FOG";};if(_0gs!=_0hs&&_0xr!=_0yr)then{if((random 100)<50)then{_0ls="OVERCAST";}else{_0ls="FOG";};};if(_0ls=="FOG")then{bpwdrx19fh2h="FOG";_0ms=_0js;_0js=floor((random 100)/25);while{_0js==_0ms}do{_0js=floor((random 100)/25);};if(_0js==0)then{bp5ycr59hcmt=_0gs+(_0hs-_0gs)*random 0.05;};if(_0js==1)then{bp5ycr59hcmt=_0gs+(_0hs-_0gs)*(0.05+random 0.2);};if(_0js==2)then{bp5ycr59hcmt=_0gs+(_0hs-_0gs)*(0.25+random 0.3);};if(_0js==3)then{bp5ycr59hcmt=_0gs+(_0hs-_0gs)*(0.55+random 0.45);};bpfycyxdq6gm=time;_0ns=_0tr*60+random((_0ur-_0tr)*60);bpmaont99vf5=time+_0ns;if(_0sr)then{["Weather forecast: Fog "+str bp5ycr59hcmt+" in "+str round(_0ns/60)+" minutes."]call bp8nybaxqxrd;};};if(_0ls=="OVERCAST")then{bpwdrx19fh2h="OVERCAST";_0os=_0ks;_0ks=3;while{_0ks==_0os}do{_0ks=floor((random 100)/25);};if(_0ks==0)then{bp5ycr59hcmt=_0xr+(_0yr-_0xr)*random 0.05;};if(_0ks==1)then{bp5ycr59hcmt=_0xr+(_0yr-_0xr)*(0.05+random 0.3);};if(_0ks==2)then{bp5ycr59hcmt=_0xr+(_0yr-_0xr)*(0.35+random 0.35);};if(_0ks==3)then{bp5ycr59hcmt=_0xr+(_0yr-_0xr)*(0.7+random 0.3);};bpfycyxdq6gm=time;_0ns=_0tr*60+random((_0ur-_0tr)*60);bpmaont99vf5=time+_0ns;if(_0sr)then{["Weather forecast: Overcast "+str bp5ycr59hcmt+" in "+str round(_0ns/60)+" minutes."]call bp8nybaxqxrd;};};if(random 100<_04r)then{private["_0is"];_0is=_02r+random(_03r-_02r);if(random 100<50)then{bp2vnqsl3ln8=-_02r-random(_0is-_02r);}else{bp2vnqsl3ln8=_02r+random(_0is-_02r);};if(random 100<50)then{bpu18qudy4hk=-_02r-random(_0is-_02r);}else{bpu18qudy4hk=_02r+random(_0is-_02r);};if(_0sr)then{["Wind changes: ["+str bp2vnqsl3ln8+", "+str bpu18qudy4hk+"]."]call bp8nybaxqxrd;};};call bpdmxdhbnelv;sleep _0ns;};};if(_05r>0)then{[_0zr,_01r,_08r,_06r,_07r,_05r,_0sr]spawn{private["_0zr","_01r","_08r","_06r","_07r","_05r","_0sr"];private["_0ps","_0qs"];_0zr=_this select 0;_01r=_this select 1;_08r=_this select 2;_06r=_this select 3;_07r=_this select 4;_05r=_this select 5;_0sr=_this select 6;if(rain>0)then{bpn22u4ydsxl=rain;publicVariable "bpn22u4ydsxl";};_0ps=time;_0qs=false;while{true}do{if(overcast>0.75)then{if(time>=_0ps)then{private["_0rs"];if(random 100<_05r&&!_0qs)then{bpn22u4ydsxl=_0zr+random(_01r-_0zr);publicVariable "bpn22u4ydsxl";_0qs=_08r;}else{bpn22u4ydsxl=0;publicVariable "bpn22u4ydsxl";_0qs=false;};_0rs=_06r*60+random((_07r-_06r)*60);_0ps=time+_0rs;if(_0sr)then{["Rain set to "+str bpn22u4ydsxl+" for "+str(_0rs/60)+" minutes"]call bp8nybaxqxrd;};};}else{if(bpn22u4ydsxl!=0)then{bpn22u4ydsxl=0;publicVariable "bpn22u4ydsxl";if(_0sr)then{["Rain stops due to low overcast."]call bp8nybaxqxrd;};};_0ps=time;_0qs=false;};if(_0sr)then{sleep 1;}else{sleep 10;};};};};};[_05r,_0sr]spawn{private["_05r","_0sr"];private["_0ts","_0ss"];_05r=_this select 0;_0sr=_this select 1;if(_0sr)then{_0ss=0.2;}else{_0ss=0.03;};if(_05r>0)then{_0ts=bpn22u4ydsxl;}else{_0ts=0;};0 setRain _0ts;sleep 0.1;while{true}do{if(_05r>0)then{if(_0ts<bpn22u4ydsxl)then{_0ts=_0ts+_0ss;if(_0ts>1)then{_0ts=1;};};if(_0ts>bpn22u4ydsxl)then{_0ts=_0ts-_0ss;if(_0ts<0)then{_0ts=0;};};}else{_0ts=0;};3 setRain _0ts;sleep 3;};};