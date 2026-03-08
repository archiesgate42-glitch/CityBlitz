{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-24.05"; # or "unstable"

  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.flutter
    pkgs.dart
    pkgs.jdk17
    pkgs.cmake
    pkgs.ninja
    pkgs.pkg-config
    pkgs.gtk3
    pkgs.xorg.libX11
    pkgs.pcre2
    pkgs.util-linux
  ];

  # Sets environment variables in the workspace
  env = {
    FLUTTER_ROOT = "${pkgs.flutter}";
    DART_ROOT = "${pkgs.dart}";
    JAVA_HOME = "${pkgs.jdk17}";
    ANDROID_HOME = "";
    CHROME_EXECUTABLE = "chromium";
  };

  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "Dart-Code.dart-code"
      "Dart-Code.flutter"
      "usernamehw.errorlens"
      "RichardCoutts.mvvm-plus"
    ];

    # Enable previews
    previews = {
      enable = true;
      previews = {
        web = {
          command = [
            "flutter"
            "run"
            "--machine"
            "-d"
            "web-server"
            "--web-hostname"
            "0.0.0.0"
            "--web-port"
            "$PORT"
          ];
          cwd = "city_blitz_app";
          manager = "flutter";
        };
      };
    };

    # Workspace lifecycle hooks
    workspace = {
      onCreate = {
        flutter-setup = ''
          cd city_blitz_app
          flutter pub get
          flutter config --no-analytics
          dart --disable-analytics
        '';
      };
      onStart = {
        # noop
      };
    };
  };
}
