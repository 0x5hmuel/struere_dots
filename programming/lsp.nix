{ config, pkgs, ... }:

{
import './nvimPlugins';
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
