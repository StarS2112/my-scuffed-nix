{config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    maple-mono.NF-unhinted
    maple-mono.CN-unhinted
    maple-mono.truetype
    inter
  ];


}
