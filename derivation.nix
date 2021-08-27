{ stdenv, pkgs, fetchzip, fetchpatch, fetchgit, fetchurl }:
stdenv.mkDerivation {
  name = "rogauracore";

  src = fetchurl {
    url = "https://github.com/wroberts/rogauracore/archive/refs/tags/1.4.tar.gz";
    sha256 = "00sc540kpwswvgyrih3rpfqcgjwn4nc3f51vn98fdqqdqwdc6c3z";
  };
  buildInputs = with pkgs;
  [ automake
    autoreconfHook
    gcc
    pkg-config
    libusb1
  ];
  configurePhase = ''
    udevdir="$out/lib/udev" ./configure --prefix="$out"
  '';
}
