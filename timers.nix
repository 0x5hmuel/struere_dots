{ config, pkgs, ... }: {

  systemd.services.planmyday-keepalive = {
    description = "Supabase Keepalive Ping";

    path = [ pkgs.postgresql ];

    script = ''
      export PGPASSWORD='yOHIOckIFzuarDxY'
      psql -h aws-1-eu-north-1.pooler.supabase.com -p 5432 -U postgres.gjzaezelxurfisygfdle -d postgres -c "SELECT 1;" > /dev/null 2>&1
    '';

    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };

  systemd.timers.planmyday-keepalive = {
    description = "Run Supabase Keepalive daily and catch up if missed";
    wantedBy = [ "timers.target" ];

    timerConfig = {
      OnCalendar = "daily";
      # Persistent=true replaces the need for 'anacron'.
      # If your laptop was turned off when the timer was supposed to trigger,
      # systemd will run it immediately when you turn the laptop back on.
      Persistent = true;
      Unit = "planmyday-keepalive.service";
    };
  };
}
