{pkgs, ...}: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    maple-mono."NF-CN"
    source-han-sans-simplified-chinese
    source-han-serif-simplified-chinese
    lxgw-wenkai
  ];
}
