{ config, pkgs, ... }:

{
  services.ollama = {
    enable = true;
    loadModels = [
      "wizard-math:7b"
      "gemma4"
      "qwen3-coder"
      "reader-lm"
      "deepseek-ocr"
    ];
  };
  services.redis.servers."default" = {
    enable = true;
    port = 6379;
  };
  services.flatpak.enable = true;
  services.upower = {
    package = pkgs.upower;
    enable = true;
  };
  services.udisks2 = {
    enable = true;
    package = pkgs.udisks;
  };
}
