{pkgs, ...}:
{
  services.greetd = {
    enable = true;
    useTextGreeter = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --asterisks --user-menu --remember --greeting WELCOME --theme border=lightred;text=white;prompt=purple;time=orange;action=green;button=LightGray;container=black;input=white --cmd niri";
        user = "greeter";
      };
    };
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
  
  environment.etc."greetd/environments".text = ''
    niri
  '';
}
