{pkgs, ...}: {
  home.packages = with pkgs; [
    openjdk21
    jdt-language-server
    lemminx
    google-java-format
  ];
}
