#!/bin/bash

killall -9 authserver
killall -9 worldserver
killall -9 htop
tmux kill-server
screen -S wow -X quit

echo "Tasks gekillt"

read -p "alte TDB Version (ex.: TDB335.20111): " old
read -p "neue TDB Version (ex.: TDB335.20121): " new
read -p "TDB Downloadlink angeben: " tdb
read -p "Solocraft compilen?(j/n): " solo

echo $old
echo $new

echo "Eingaben angenommen"

wget ${tdb}
git clone -b ${new} --single-branch --depth 1 https://github.com/TrinityCore/TrinityCore.git
mv TrinityCore TrinityCore-${new}
zip -r TrinityCore-${new}.zip TrinityCore-${new}

rm -rf TrinityCore-${old}
#src=TrinityCore-${new}.zip
src_dir=TrinityCore-${new}
#unzip ${src}
p7zip -d TDB*.7z
#rm ${src}

echo "Archive entpackt"

if [ ${solo} = 'j' ]
then
	cp Solocraft.cpp ${src_dir}/src/server/scripts/Custom/
	cp custom_script_loader.cpp ${src_dir}/src/server/scripts/Custom/
else
	rm ${src_dir}/src/server/scripts/Custom/Solocraft.cpp
	cp custom_script_loader_noScript.cpp ${src_dir}/src/server/scripts/Custom/custom_script_loader.cpp
fi

cd TrinityCore-${new}
mkdir build
cd build
cmake ../ -DCMAKE_INSTALL_PREFIX=/home/$USER/server -DTOOLS=1 -DWITH_WARNINGS=1
make -j $(nproc)
make install

echo "Compiling beendet"

cd ../..
rm -rf TrinityCore-${new}/build

echo "CMake Cache geloescht"

mysql -u user -p'pw' -e "DROP DATABASE world;"
mysql -u user -p'pw' -e "CREATE DATABASE world;"
mysql -u user -p'pw' world < TDB*.sql
rm TDB*.sql

echo "world DB geupdatet"

mysqldump -u user -p'pw' auth > auth.sql
mysqldump -u user -p'pw' characters > characters.sql

echo "auth und characters gedumpt"

for sql in ${src_dir}/sql/old/3.3.5a/auth/${old: -5}*/*.sql
do 
	mysql -u user -p'pw' auth < ${sql}
    echo $sql	
done

echo "auth DB geupdatet"

for sql in ${src_dir}/sql/old/3.3.5a/characters/${old: -5}*/*.sql
do 
	mysql -u user -p'pw' characters < ${sql} 
	echo $sql
done

echo "characters DB geupdatet"

./server.sh
