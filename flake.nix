{
  inputs = { nixpkgs.url = "github:nixos/nixpkgs"; };

  outputs = { nixpkgs, self }:
    let
			genPackage = system:
				let pkgs = nixpkgs.legacyPackages.${system};
				in rec {
					fairfax-nerdfont = pkgs.callPackage ./default.nix { };
					default = fairfax-nerdfont;
				};
    in {
			packages = {
				x86_64-linux = genPackage "x86_64-linux";
				aarch64-linux = genPackage "aarch64-linux";
			};
    };
}
