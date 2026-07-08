with import <nixpkgs> {};
stdenv.mkDerivation (finalAttrs: {
  pname = "keyboardsounds-pro";
  version = "desktop/v0.2.6";

  src = fetchFromGitHub {
    owner = "keyboard-sounds";
    repo = "keyboardsounds-pro";
    rev = "${finalAttrs.version}";
    hash = "sha256-wFfSjRGtwNL0Ug4QjHx9upBLyRYZpncaZUakRwQVO04=";
	};
  nativeBuildInputs = [ dpkg ];
  unpackPhase = ''
		dpkg-deb -x $src
  '';
  installPhase = ''
		mkdir -p $out
		cp -r usr/* $out/
  '';

})
