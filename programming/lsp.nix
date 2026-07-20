{ config, pkgs, ... }:

{
  imports = [ ./nvimPlugins.nix ];
  environment.systemPackages = with pkgs; [
    black
    zuban
    stylua
    fmt
    pyright
    harper
    eslint
    ruff
    prettier
    prettierd
    basedpyright
  ];
}
