{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.dnsproxy;
in {
  options.services.dnsproxy = {
    enable = mkEnableOption "dnsproxy";

    upstream = mkOption {
      type = types.str;
      default = "https://mozilla.cloudflare-dns.com/dns-query";
      description = "Upstream to be used.";
    };

    bootstrap = mkOption {
      type = types.str;
      default = "1.1.1.1:53";
      description = "Bootstrap DNS for DoH and DoT.";
    };

    port = mkOption {
      type = types.int;
      default = 53;
      description = "Port the service should bind to.";
    };

    verbose = mkOption {
      type = types.bool;
      default = false;
      description = "Enable verbose output.";
    };
  };

  config = mkIf cfg.enable {
    systemd.services.dnsproxy = {
      description = "dnsproxy";
      wantedBy = [ "multi-user.target" "sleep.target"];
      after = [ "network-online.target" ];
      bindsTo = [ "network-online.target" ];

      serviceConfig = {
        ExecStart = "${pkgs.dnsproxy}/bin/dnsproxy ${if cfg.verbose then "-v" else ""} -u ${cfg.upstream} -b ${cfg.bootstrap} -p ${toString cfg.port}";
        Restart = "always";
        StartLimitInterval = 0;
        RestartSec = 1;
        ProtectSystem = true;
        ProtectHome = true;
        PrivateTmp = true;
      };
    };

    environment.systemPackages = [ pkgs.dnsproxy ];
  };
}
