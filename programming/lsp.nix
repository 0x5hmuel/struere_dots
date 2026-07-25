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
    clang
    ruff
    prettier
    prettierd
    basedpyright
  ];
}
