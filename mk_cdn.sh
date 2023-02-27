#!/bin/bash

read -p "WoW Version mit Build angeben(z.B 10.0.5.48069:" version
build=$(cut -d '.' -f 4 <<< $version)
mkdir -p html/{blz_us,blz_eu,EU,classic,classic_era/wow/$build,US/wow/$build}
curl http://us.patch.battle.net:1119/wow/versions -o html/blz_us/versions
curl http://us.patch.battle.net:1119/wow/cdns -o html/blz_us/cdns
curl http://eu.patch.battle.net:1119/wow/versions -o html/blz_eu/versions
curl http://eu.patch.battle.net:1119/wow/cdns -o html/blz_eu/cdns
curl http://eu.patch.battle.net:1119/wow_classic/versions -o html/classic/versions
curl http://eu.patch.battle.net:1119/wow_classic/cdns -o html/classic/cdns
curl http://eu.patch.battle.net:1119/wow_classic_era/versions -o html/classic_era/versions
curl http://eu.patch.battle.net:1119/wow_classic_era/cdns -o html/classic_era/cdns
curl http://ngdp.arctium.io/US/wow/$build/versions -o html/US/wow/$build/versions
curl http://ngdp.arctium.io/US/wow/cdns -o html/US/wow/cdns
curl http://ngdp.arctium.io/EU/wow/$build/versions -o html/EU/wow/$build/versions
curl http://ngdp.arctium.io/EU/wow/cdns -o html/EU/wow/cdns
