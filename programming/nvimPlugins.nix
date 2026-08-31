{ config, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    vimPlugins.kulala-nvim
    vimPlugins.nvim-treesitter
  ];

}
