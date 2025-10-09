{ nix-colors }:

nix-colors.lib.schemeFromYAML "4bit" (builtins.readFile ./4bit.yaml)
