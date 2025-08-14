{
  inputs = { nixpkgs.url = "github:nixos/nixpkgs"; };

  outputs = { nixpkgs, self }:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      packages.x86_64-linux = {
        fairfax-nerdfont = pkgs.callPackage ./default.nix { };
        default = self.packages.x86_64-linux.fairfax-nerdfont;
      };
    };
}
