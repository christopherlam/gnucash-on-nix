{ pkgs ? import <nixpkgs> {} # here we import the nixpkgs package set
}:
pkgs.mkShell {
  name = "gnucash-environment";
  buildInputs = [
    pkgs.glib
    pkgs.gtk3
    pkgs.guile_3_0
    pkgs.libxml2
    pkgs.gettext
    pkgs.libxslt
    pkgs.icu
    pkgs.boost175
    pkgs.swig
    pkgs.webkitgtk
    pkgs.gtest
    pkgs.gwenhywfar
    pkgs.aqbanking
    pkgs.python310
    pkgs.zlib
    pkgs.cmake
    pkgs.gcc
    pkgs.ninja
    pkgs.git
    pkgs.pkgconfig
    pkgs.perl
    pkgs.pcre
    pkgs.mount
    pkgs.libofx
    pkgs.libdbi
    pkgs.libdbiDrivers
    pkgs.libxslt
    pkgs.isocodes
    pkgs.glibcLocales
    pkgs.stdenv
  ];
  shellHook = ''
    echo "Start developing GnuCash..."
  '';
}
