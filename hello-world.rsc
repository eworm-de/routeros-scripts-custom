#!rsc by RouterOS
# RouterOS script: hello-world
# Copyright (c) 2023-2024 Christian Hesse <mail@eworm.de>
# https://git.eworm.de/cgit/routeros-scripts-custom/about/COPYING.md
#
# hello-world demo script
# https://git.eworm.de/cgit/routeros-scripts-custom/about/doc/hello-world.md

:global GlobalFunctionsReady;
:while ($GlobalFunctionsReady != true) do={ :delay 500ms; }

:do {
  :local ScriptName [ :jobname ];

  :global LogPrintExit2;
  :global ScriptFromTerminal;
  :global SendNotification2;

  :if ([ $ScriptFromTerminal $ScriptName ] = true) do={
    $LogPrintExit2 info $ScriptName ("Hello world!") false;
  } else={
    $SendNotification2 ({ origin=$ScriptName; subject="Hello..."; message="... world!" });
  }
} on-error={ }
