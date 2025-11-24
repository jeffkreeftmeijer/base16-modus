{
  inputs = {
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };
  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in {
        base16-ef-themes = pkgs.stdenv.mkDerivation {
          name = "base-16-ef-themes";
          src = ./.;
          postInstall = ''
            mkdir $out
            cp *.yaml $out
          '';
        };

        devShell = with pkgs;
          mkShell {
            buildInputs = [
              ((emacsPackagesFor emacs-nox).emacsWithPackages (epkgs: [
                (epkgs.elpaBuild {
                  pname = "standard-themes";
                  version = "3.0.2";
                  packageRequires = [
                    (epkgs.elpaBuild {
                      pname = "modus-themes";
                      version = "5.1.0";
                      src = fetchurl {
                        url = "https://elpa.gnu.org/packages/modus-themes-5.1.0.tar";
                        sha256 = "sha256-1GpJUaqwC/E7Op6AdNUdEwGIgr4HRdBOzdqk+4eD9Vg=";
                      };
                    })
                  ];
                  src = fetchurl {
                    url = "https://elpa.gnu.org/packages/standard-themes-3.0.2.tar";
                    sha256 = "sha256-lf1tm9ktLkZolhxD5bn/l2CXNOOpALD2jYyV5TozMxw=";
                  };
                })
                (epkgs.elpaBuild {
                  pname = "modus-themes";
                  version = "5.1.0";
                  src = fetchurl {
                    url = "https://elpa.gnu.org/packages/modus-themes-5.1.0.tar";
                    sha256 = "sha256-1GpJUaqwC/E7Op6AdNUdEwGIgr4HRdBOzdqk+4eD9Vg=";
                  };
                })
                (epkgs.elpaBuild {
                  pname = "ef-themes";
                  version = "2.0.1";
                  packageRequires = [
                    (epkgs.elpaBuild {
                      pname = "modus-themes";
                      version = "5.1.0";
                      src = fetchurl {
                        url = "https://elpa.gnu.org/packages/modus-themes-5.1.0.tar";
                        sha256 = "sha256-1GpJUaqwC/E7Op6AdNUdEwGIgr4HRdBOzdqk+4eD9Vg=";
                      };
                    })
                  ];
                  src = fetchurl {
                    url = "https://elpa.gnu.org/packages/ef-themes-2.0.1.tar";
                    sha256 = "sha256-lhhOuO7xe0ynkLCv1IsNwVAyi8kfHQAE0edyTgeDMg0=";
                  };
                })
              ]))
            ];
          };
      }
    );
}
