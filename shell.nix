{pkgs ? import <nixpkgs> {}}: let
  pythonEnv = pkgs.python310.withPackages (ps:
    with ps; [
      virtualenv
      # jinja2
      # pyyaml
    ]);

  crossPkgs = pkgs.pkgsCross.arm-embedded;
in
  pkgs.mkShell {
    buildInputs = [
      pythonEnv
      pkgs.libusb
      crossPkgs.buildPackages.gcc # Provides the ARM GCC compiler, including g++
      pkgs.pkgsCross.arm-embedded.stdenv.cc
      crossPkgs.newlib # C library for embedded systems
      pkgs.gnumake # GNU make
      pkgs.tup
      pkgs.openocd
    ];
    LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [pkgs.libusb];
    shellHook = ''
      virtualenv odrive-env
      source odrive-env/bin/activate
      pip install odrive
      export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath [pkgs.libusb]}:$LD_LIBRARY_PATH
    '';
  }
