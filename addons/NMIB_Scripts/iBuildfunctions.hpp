class CfgFunctions {

	class NerdMod_Mod {
		tag = "NMIB";

		class iBuild_Mod {

			class iBuild_Init {
				preInit = 1;
				file = "\addons\NMIB_Scripts\iBuild_Init.sqf";
			};
		};

		class Core {
			file = "\addons\NMIB_Scripts\NMIB_Functions\Core";
			preInit = 1;

			class NearestFoundation {
			};

			class GridSnapMechanic {
			};

			class SnapDirection {
			};

			class FilterObjects {
			};

			class ModuleCheck {
			};

			class UpdateGhostCol {
			};
		};

		class HUD {
			file = "\addons\NMIB_Scripts\NMIB_Functions\HUD";
			preInit = 1;

			class UpdateHUD {
			};
		};

		class RuleSets {
			file = "\addons\NMIB_Scripts\NMIB_Functions\RuleSets";
			preInit = 1;

			class FoundationRules {
			};

			class FloorRules {
			};

			class WallRules {
			};

			class ElevationRules {
			};
		};

		class Controls {
			file = "\addons\NMIB_Scripts\NMIB_Functions\Controls";
			preInit = 1;

			class KeyUp {
			};

			class KeyDown {
			};

			class SelectModule {
			};

			class ConstructModule {
			};
		};
	};
};