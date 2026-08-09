{config, pkgs, ...}:
let
	androidOreoCursor = pkgs.stdenv.mkDerivation {
		name = "android_oreo_cursor"
	}
in


