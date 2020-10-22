{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.services.logid;
in {
  options.services.logid = {
    enable = mkEnableOption "logid Logitech configuration daemon";

    config = mkOption {
      type = types.nullOr types.str;
      default = null;
      description= "Configuration for the logid service";
    };
  };

  config = mkIf cfg.enable {
    assertions = [
      {
        assertion = cfg.config != null;
        message = "config must be specified";
      }
    ];

    environment.etc = {
      "logid.cfg".source = pkgs.writeText "logid.cfg" cfg.config;
    };

    systemd.services.logid = {
      description = "Logitech Configuration Daemon";
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        StartLimitInterval = 0;
        Restart = "on-failure";
        Type = "simple";
        User = "root";
        ExecStart = "${pkgs.logiops}/bin/logid";
      };
    };

    environment.systemPackages = [ pkgs.logiops ];
  };
}
