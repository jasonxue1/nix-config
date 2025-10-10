{pkgs, ...}: {
  home.packages = with pkgs.llvmPackages; [
    clang
    llvm
    lld
    lldb
    clang-tools
    compiler-rt
    libcxx
    openmp
  ];
}
