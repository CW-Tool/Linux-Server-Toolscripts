#!/bin/bash

sed -i 's/utf8mb4_0900_ai_ci/utf8_general_ci/g' world.sql
sed 's/\sDEFINER=`[^`]*`@`[^`]*`//g' -i world.sql
