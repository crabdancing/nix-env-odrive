{ pkgs ? import <nixpkgs> {} }:
let
  pythonEnv = pkgs.python310.withPackages (ps: with ps; [
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
    # pkgs.stdenv.cc
    crossPkgs.buildPackages.gcc # Provides the ARM GCC compiler, including g++
    pkgs.pkgsCross.arm-embedded.stdenv.cc 
    crossPkgs.newlib # C library for embedded systems
    pkgs.gnumake # GNU make
    pkgs.tup
    pkgs.openocd
  ];
  LD_LIBRARY_PATH= pkgs.lib.makeLibraryPath [ pkgs.libusb ];
  shellHook = ''
    virtualenv odrive-env
    source odrive-env/bin/activate
    pip install odrive
    # pip install PyYAML
    # pip install Jinja2
    # pip install jsonschema
    # pip install yaml
    export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath [ pkgs.libusb ]}:$LD_LIBRARY_PATH
    # export AR=${crossPkgs.buildPackages.binutils}/bin/arm-none-eabi-ar
    # export AS=${crossPkgs.buildPackages.binutils}/bin/arm-none-eabi-as
    # export CC=${crossPkgs.buildPackages.gcc}/bin/arm-none-eabi-gcc
    # export CXX=${crossPkgs.buildPackages.gcc}/bin/arm-none-eabi-g++
    # export LD=${crossPkgs.buildPackages.binutils}/bin/arm-none-eabi-ld
    # export STRIP=${crossPkgs.buildPackages.binutils}/bin/arm-none-eabi-strip
    # export OBJDUMP=${crossPkgs.buildPackages.binutils}/bin/arm-none-eabi-objdump
    # export OBJCOPY=${crossPkgs.buildPackages.binutils}/bin/arm-none-eabi-objcopy
    # export SIZE=${crossPkgs.buildPackages.binutils}/bin/arm-none-eabi-size

    # Ensure all compilation uses hard float ABI and the correct FPU
    # export CFLAGS="-mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16"
    # export CXXFLAGS="-mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16"
    # export LDFLAGS="-mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16"
  '';
}


