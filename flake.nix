{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    surge.url = "github:SurgeDM/Surge/b6329cffb250300b2d1ab49d242ad41d372872f5";
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs"; # this line is optional, prevents downloading two versions of nixpkgs but disables cache
    };
    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    {
      self,
      nixpkgs,
      surge,
      noctalia,
      caelestia-shell,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.struerelabs = nixpkgs.lib.nixosSystem {
        inherit system; # system = system

        modules = [
          ./configuration.nix

          ({ pkgs, ... }: {
            environment.systemPackages = with pkgs; [
              (surge.packages.${system}.default.overrideAttrs (oldAttrs: {
                vendorHash = "sha256-lEE99rVSnq8v4BViSknlGivbMgCt2926aaZPng2uFnk=";
              }))
              emacs
              nixfmt
              steam
              noctalia.packages.${system}.default
              caelestia-shell
              caelestia-dots.packages.${system}.default
            ];
          })
        ];
      };
    };
}
