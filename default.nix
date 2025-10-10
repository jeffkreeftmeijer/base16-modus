{nix-colors}:
nix-colors.lib.schemeFromYAML "modus-vivendi-tinted" (builtins.readFile ./modus-vivendi-tinted.yaml)
