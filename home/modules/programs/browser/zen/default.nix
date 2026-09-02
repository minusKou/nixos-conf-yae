{
  inputs,
  ...
}: {
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    languagePacks = ["en-US"];

    policies = import ./policies-config.nix;

    setAsDefaultBrowser = true;
    enablePrivateDesktopEntry = true;

    profiles.default = rec {
      settings = {
        "zen.workspaces.continue-where-left-off" = true;
        "zen.workspaces.natural-scroll" = true;
        "zen.view.compact.hide-tabbar" = true;
        "zen.view.compact.hide-toolbar" = true;
        "zen.view.compact.animate-sidebar" = false;
        "zen.welcome-screen.seen" = true;
        "zen.urlbar.behavior" = "float";
        "zen.theme.hide-unified-extensions-button" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

        # marionette sets this to true and only clears it on a clean shutdown;
        # left on, gecko fakes window focus and dead keys stop composing (á, ñ)
        "focusmanager.testmode" = false;
      };

      presets.betterfox.enable = true;

      extensions.settings."{74145f27-f039-47ce-a470-a662b129930a}" = {
        force = true;
        settings = {
          badged_color = "#7b383a";
          badgedStatus = true;
          domainBlocking = false;
          eTagFiltering = true;
          hashURL = "https://rules2.clearurls.xyz/rules.minify.hash";
          historyListenerEnabled = true;
          localHostsSkipping = true;
          logLimit = 250;
          loggingStatus = true;
          pingBlocking = true;
          referralMarketing = true;
          ruleURL = "https://rules2.clearurls.xyz/data.minify.json";
          statisticsStatus = true;
        };
      };

      extensionButtons = {
        "nav-bar" = ["uBlock0@raymondhill.net"];
      };

      sine = {
        enable = true;
        mods = [
          "253a3a74-0cc4-47b7-8b82-996a64f030d5" # Floating History
          "4ab93b88-151c-451b-a1b7-a1e0e28fa7f8" # No Sidebar Scrollbar
          "7190e4e9-bead-4b40-8f57-95d852ddc941" # Tab title fixes
          "803c7895-b39b-458e-84f8-a521f4d7a064" # Hide Inactive Workspaces
          "906c6915-5677-48ff-9bfc-096a02a72379" # Floating Status Bar
          "a6335949-4465-4b71-926c-4a52d34bc9c0" # Better Find Bar
          "c6813222-6571-4ba6-8faf-58f3343324f6" # Disable Rounded Corners
          "c8d9e6e6-e702-4e15-8972-3596e57cf398" # Zen Back Forward
          "cb15abdb-0514-4e09-8ce5-722cf1f4a20f" # Hide Extension Name
          "d8b79d4a-6cba-4495-9ff6-d6d30b0e94fe" # Better Active Tab
          "e122b5d9-d385-4bf8-9971-e137809097d0" # No Top Sites
          "f7c71d9a-bce2-420f-ae44-a64bd92975ab" # Better Unloaded Tabs
          "fd24f832-a2e6-4ce9-8b19-7aa888eb7f8e" # Quietify
          "context-menu-icons"
        ];
      };

      spaceRouting.defaultExternalRoute = spaces."Rendezvous".id;

      pinsForce = true;
      pinsForceAction = "demote";

      containersForce = true;

      spacesForce = true;
      spaces = {
        "Rendezvous" = {
          id = "572910e1-4468-4832-a869-0b3a93e2f165";
          icon = "chrome://browser/skin/zen-icons/selectable/navigate.svg";
          position = 1000;

          theme = {
            type = "gradient";
            colors = [
              {
                red = 123;
                green = 56;
                blue = 58;
                algorithm = "analogous";
                type = "explicit-lightness";
                lightness = 35;
                position.x = 301;
                position.y = 176;
                primary = true;
                custom = false;
              }
              {
                red = 123;
                green = 110;
                blue = 55;
                algorithm = "analogous";
                type = "explicit-lightness";
                lightness = 35;
                position.x = 260;
                position.y = 271;
                primary = false;
                custom = false;
              }
              {
                red = 122;
                green = 56;
                blue = 114;
                algorithm = "analogous";
                type = "explicit-lightness";
                lightness = 35;
                position.x = 255;
                position.y = 84;
                primary = false;
                custom = false;
              }
            ];
            opacity = 0.8;
            texture = 0.5;
          };
        };
        "Research" = {
          id = "ec287d7f-d910-4860-b400-513f269dee77";
          icon = "chrome://browser/skin/zen-icons/selectable/logo-rss.svg";
          position = 1001;
          theme = {
            type = "gradient";
            colors = [
              {
                red = 171;
                green = 219;
                blue = 227;
                algorithm = "floating";
                type = "explicit-lightness";
              }
            ];
            opacity = 0.2;
            texture = 0.5;
          };
        };
      };
    };
  };
}
