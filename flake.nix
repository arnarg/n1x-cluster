{
  description = "My ArgoCD configuration with n1x.";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.n1x.url = "github:arnarg/n1x";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    n1x,
  }: (flake-utils.lib.eachDefaultSystem (system: let
    pkgs = import nixpkgs {
      inherit system;
    };
  in {
    n1xApplications = n1x.lib.n1xConfiguration {
      inherit pkgs;
      modules = [./configuration.nix];
    };
    packages.n1x = n1x.packages.${system}.default;
  }));
}
