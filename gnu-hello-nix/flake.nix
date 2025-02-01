{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ...}:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
        {
	  packages = {
	    hello = pkgs.stdenv.mkDerivation {
	      pname = "hello";
	      version = "2.12";
	      src = ./hello-2.12.tar.gz;
	    };
	  };
        }
    );
}
