# Ausprobieren
Mit Flocken:
```console
nix run github:Hafflationist/neovim-flocke
```
# Installieren

## Flocken
Füge diese Flocke als Eingabe hinzu:
```nix
#flake.nix
{
  inputs = {
    neovim-flocke = {
      url = "github:Hafflationist/neovim-flocke";
      inputs.nixpkgs.follows = "nixpkgs";
    };
...
```
(Stelle sicher, dass du Eingaben an deine [Module](https://blog.nobbz.dev/posts/2022-12-12-getting-inputs-to-modules-in-a-flake/) weitergibst)
### Hinzufügen in Nutzerumgebung
```nix
#irgendeinModul.nix
{inputs, pkgs, ...}:
{

# add system wide
  environment.systemPackages = [
    inputs.neovim-flocke.packages.${pkgs.system}.neovim
  ];
# add per-user
  users.users."<name>".packages = [
    inputs.neovim-flocke.packages.${pkgs.system}.neovim
  ];
}
```

## Inspiration
- [neovim-flake](https://github.com/gvolpe/neovim-flake) von [@gvolpe](https://github.com/gvolpe)
- [nvim-flake](https://github.com/Gerg-L/nvim-flake) von [@Gerg-L](https://github.com/Gerg-L)
