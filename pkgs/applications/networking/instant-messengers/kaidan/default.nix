{
  stdenv,
  lib,
  fetchFromGitLab,
  cmake,
  extra-cmake-modules,
  pkg-config,
  wrapQtAppsHook,
  qtbase,
  qttools,
  qtmultimedia,
  qtlocation,
  qqc2-desktop-style,
  kirigami-addons,
  kirigami,
  kio,
  knotifications,
  kquickimageedit,
  zxing-cpp,
  qxmpp,
  sonnet,
  gst_all_1,
  prison,
}:

stdenv.mkDerivation rec {
  pname = "kaidan";
  version = "0.11.0";

  src = fetchFromGitLab {
    domain = "invent.kde.org";
    owner = "network";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-8pC4vINeKSYY+LlVgCXUtBq9UjraPdTikBOwLBLeQ3Y=";
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    pkg-config
    wrapQtAppsHook
  ];

  buildInputs = with gst_all_1; [
    qtbase
    qttools
    qtmultimedia
    qtlocation
    qqc2-desktop-style
    kirigami-addons
    kirigami
    kio
    knotifications
    kquickimageedit
    zxing-cpp
    qxmpp
    sonnet
    gstreamer
    gst-plugins-bad
    gst-plugins-base
    (gst-plugins-good.override { qt6Support = true; })
    prison
  ];
  postInstall = ''
    qtWrapperArgs+=(--prefix GST_PLUGIN_SYSTEM_PATH_1_0 : "$GST_PLUGIN_SYSTEM_PATH_1_0")
  '';

  meta = with lib; {
    description = "User-friendly and modern chat app, using XMPP";
    mainProgram = "kaidan";
    longDescription = ''
      Kaidan is a user-friendly and modern chat app for every device. It uses
      the open communication protocol XMPP (Jabber). Unlike other chat apps,
      you are not dependent on one specific service provider.

      Kaidan does not have all basic features yet and has still some
      stability issues. Current features include audio messages, video
      messages, and file sharing.
    '';
    homepage = "https://www.kaidan.im";
    license = with licenses; [
      gpl3Plus
      mit
      asl20
      cc-by-sa-40
    ];
    maintainers = with maintainers; [ astro ];
    platforms = with platforms; linux;
  };
}
