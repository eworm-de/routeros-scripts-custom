#!rsc by RouterOS
# RouterOS script: hello-world
# Copyright (c) 2023 Christian Hesse <mail@eworm.de>
# https://git.eworm.de/cgit/routeros-scripts-custom/about/COPYING.md
#
# hello-world demo script
# https://git.eworm.de/cgit/routeros-scripts-custom/about/doc/hello-world.md

:local 0 "hello-world";
:global GlobalFunctionsReady;
:while ($GlobalFunctionsReady != true) do={ :delay 500ms; }

:global LogPrintExit2;
:global ScriptFromTerminal;
:global SendNotification2;

:if ([ $ScriptFromTerminal $0 ] = true) do={
  $LogPrintExit2 info $0 ("Hello world!") false;
} else={
  $SendNotification2 ({ origin=$0; subject="Hello..."; message="... world!" });
}
