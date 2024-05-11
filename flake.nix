{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    neovim-src = {
      url = "github:neovim/neovim";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    neovim-src,
    ...
  }: let
    inherit (nixpkgs) lib;
    withSystem = f:
      lib.fold lib.recursiveUpdate {}
      (map f ["x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin"]);
  in
    withSystem (system: 
    let
      pkgs = nixpkgs.legacyPackages.${system};
      dockerImage = pkgs.dockerTools.buildImage {
        name = "hafflationist/h-nvim";
        tag = "latest";
        copyToRoot = [ self.packages.${system}.neovim];
        config = {
          Cmd = [ "nvim" "lokal" "new" "-c" "bn" ];
        };
      };
    in {
      formatter.${system} = pkgs.alejandra;

      overlays.default = final: _: removeAttrs self.packages.${final.system} ["default"];
      overlay = self.overlays.default;
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          #self.packages.${system}.default
          pkgs.npins
        ];
      };

      packages.${system} = {
        inherit dockerImage;

        default = self.packages.${system}.neovim;

        neovim = let
          neovimConfig = pkgs.neovimUtils.makeNeovimConfig {
            plugins =
              [pkgs.vimPlugins.nvim-treesitter.withAllGrammars]
              ++ lib.mapAttrsToList (
                pname: v: (pkgs.vimUtils.buildVimPluginFrom2Nix {
                  inherit pname;
                  version = builtins.substring 0 8 v.revision;
                  src = if v.url != null 
                        then builtins.fetchTarball {
                            inherit (v) url;
                            sha256 = v.hash;
                          }
                          else builtins.fetchGit {
                            inherit (v.repository) url;
                            rev = v.revision;
                          }
                          ;
                })
              )
              (import ./npins);
            withPython3 = false; # unnötig, bläht den Bums nur auf
            withNodeJs = true; # benötigt von coc
            extraPython3Packages = _: [];
            withRuby = false; # unnötig, bläht den Bums nur auf
            viAlias = true;
            vimAlias = true;
            customRC = (import ./pluginConfig) self;
          };
          wrapperArgs = let
            path = lib.makeBinPath (
              builtins.attrValues
              {
                inherit
                  (pkgs)
                  #nix
                  git
                  
                  deadnix
                  statix
                  #alejandra
                  nil
                  ghc
                  haskell-language-server
                  #other
                  
                  ripgrep
                  fd
                  ;
              }
            );
          in
            neovimConfig.wrapperArgs
            ++ [
              "--prefix"
              "PATH"
              ":"
              path
            ];
        in
          pkgs.wrapNeovimUnstable (pkgs.neovim-unwrapped.overrideAttrs {
            src = neovim-src;
            version = neovim-src.shortRev or "dirty";
            patches = [];
            preConfigure = ''
              sed -i cmake.config/versiondef.h.in -e "s/@NVIM_VERSION_PRERELEASE@/-dev-$version/"
            '';
          })
          (neovimConfig // {inherit wrapperArgs;});
      };
    });
}
