#!/bin/bash

mail -s 'AzerothCore Compilelog' mail@example.com -A /home/$USER/server/bin/log/Auth.log -A /home/$USER/server/bin/log/Server.log -A /home/$USER/server/bin/log/DBImport.log -A /home/$USER/compilelog.log <<< "Melde Vollzug!"

