#!rsc by RouterOS
# RouterOS script: hello-world
# Copyright (c) 2023-2025 Christian Hesse <mail@eworm.de>
# https://git.eworm.de/cgit/routeros-scripts-custom/about/COPYING.md
#
# hello-world demo script
# https://git.eworm.de/cgit/routeros-scripts-custom/about/doc/hello-world.md

:local ExitOK false;
onerror Err {
  :global GlobalFunctionsReady;
  :retry { :if ($GlobalFunctionsReady != true) \
      do={ :error ("Global functions not ready."); }; } delay=500ms max=50;
  :local ScriptName [ :jobname ];

  :global LogPrint;
  :global ScriptFromTerminal;
  :global SendNotification2;

  :if ([ $ScriptFromTerminal $ScriptName ] = true) do={
    $LogPrint info $ScriptName ("Hello world!");
  } else={
    $SendNotification2 ({ origin=$ScriptName; subject="Hello..."; message="... world!" });
  }
} do={
  :global ExitError; $ExitError $ExitOK [ :jobname ] $Err;
}
