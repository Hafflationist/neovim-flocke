FROM nixos/nix:2.22.0

RUN mkdir /flocke
RUN mkdir /flocke/npins
RUN mkdir /flocke/pluginConfig

COPY flake.* /flocke
COPY npins/* /flocke/npins
COPY pluginConfig/* flocke/pluginConfig

WORKDIR /flocke

RUN nix --extra-experimental-features "nix-command flakes" build

ENTRYPOINT nix --extra-experimental-features "nix-command flakes" run
