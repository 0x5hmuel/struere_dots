{ config, pkgs, ... }:

{
import './nvimPlugins.nix';
  environment.systemPackages = with pkgs; [
    zuban
    stylua
    fmt
    pyright
    harper
    eslint
    ruff
    prettier
    prettierd
  ];
}
