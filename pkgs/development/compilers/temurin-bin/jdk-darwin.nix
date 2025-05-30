{ lib, callPackage }:

let
  sources = (lib.importJSON ./sources.json).hotspot.mac;
  common = opts: callPackage (import ./jdk-darwin-base.nix opts) { };

in
# EOL = [ "This JDK version has reached End of Life." ];
{
  jdk-8 = common { sourcePerArch = sources.jdk.openjdk8; };
  jre-8 = common { sourcePerArch = sources.jre.openjdk8; };

  jdk-11 = common { sourcePerArch = sources.jdk.openjdk11; };
  jre-11 = common { sourcePerArch = sources.jre.openjdk11; };

  jdk-17 = common { sourcePerArch = sources.jdk.openjdk17; };
  jre-17 = common { sourcePerArch = sources.jre.openjdk17; };

  jdk-21 = common { sourcePerArch = sources.jdk.openjdk21; };
  jre-21 = common { sourcePerArch = sources.jre.openjdk21; };

  jdk-23 = common { sourcePerArch = sources.jdk.openjdk23; };
  jre-23 = common { sourcePerArch = sources.jre.openjdk23; };

  jdk-24 = common { sourcePerArch = sources.jdk.openjdk24; };
  jre-24 = common { sourcePerArch = sources.jre.openjdk24; };
}
