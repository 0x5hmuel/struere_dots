{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    surge.url = "github:SurgeDM/Surge/b6329cffb250300b2d1ab49d242ad41d372872f5";
  };

  # Added ', ...' to outputs to gracefully handle any underlying inputs
  outputs =
    {
      self,
      nixpkgs,
      surge,
      ...
    }:
    {
      # 1. Changed 'nixos.lib' to 'nixpkgs.lib'
      nixosConfigurations.struerelabs = nixpkgs.lib.nixosSystem {
        stdenv.hostPlatform.system = "x86_64-linux";

        modules = [
          /etc/nixos/configuration.nix

          # 3. Separated this inline module with a space/new line so it's a distinct list item
          ({ pkgs, ... }: {
            environment.systemPackages = with pkgs; [
              (surge.packages.${system}.default.overrideAttrs (oldAttrs: {
                vendorHash = "sha256-lEE99rVSnq8v4BViSknlGivbMgCt2926aaZPng2uFnk=";
                # Note: If it complains about proxyVendor, change vendorHash to proxyVendor above
              }))
              emacs
              nixfmt
            ];
          })
        ];
      };
    };
}
