{ stdenv, fairfax, nerd-font-patcher }:
stdenv.mkDerivation {
  name = "fairfax-nerdfont";
  version = "1.0.0";

  nativeBuildInputs = [ nerd-font-patcher ];

  unpackPhase = "true";

  buildPhase = ''
    runHook preBuild

    for file in ${fairfax}/share/fonts/truetype/*; do
    nerd-font-patcher --complete $file
    done

    runHook postBuild
  '';

  installPhase =
    "	runHook preInstall\n\n	mkdir -p $out/share/fonts/truetype\n	cp Fairfax* $out/share/fonts/truetype/\n\n	runHook postInstall\n";
}
