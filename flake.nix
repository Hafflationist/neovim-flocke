{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { self, nixpkgs, ...} @ inputs: {
    packages.x86_64-linux = {
      default = self.packages.x86_64-linux.neovim;
      neovim =
        (inputs.nvf.lib.neovimConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [
            ./nvf-configuration.nix
          ];
        })
        .neovim;
    };
  };
}
