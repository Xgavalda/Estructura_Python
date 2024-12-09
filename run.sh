#!/bin/bash

# Comproveu la presència de la carpeta venv
if [ ! -d "venv" ]; then
    echo "Creant un entorn virtual..."
    python3 -m venv venv
fi

echo "Activant l'entorn virtual..."
source venv/bin/activate

# Comproveu si la bandera està establerta a l'entorn virtual
if [ ! -f "venv/installed" ]; then
    if [ -f "requirements.txt" ]; then
		echo "Instal·lació de la roda per a una instal·lació més ràpida"
		pip3 install wheel
        echo "S'estan instal·lant dependències..."
        pip3 install -r requirements.txt
        touch venv/installed
    else
        echo "requirements.txt no trobat, saltant la instal·lació de dependències."
    fi
else
    echo "Dependències ja instal·lades, saltant la instal·lació."
fi

if [ ! -f ".env" ]; then
	echo "S'està copiant el fitxer de configuració"
	cp .env-example .env
else
	echo "S'està saltant la còpia .env"
fi

echo "S'està iniciant el programa..."
python3 main.py

echo "Fet"
