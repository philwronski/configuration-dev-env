#!/bin/sh

function log() {
        NOW=$(date "+%Y-%m-%d %H:%M:%S")
        echo "[ $NOW ] - $1"
}

log "Vérification de l'installation de Node.js"
if test ! "$(which node)"
then
        log "Node.js n'est pas installé, veuillez installer Node.js avant d'éxécuter ce script"
        exit
else log "Node.js => OK"
fi

log "Vérification de l'installation de Yarn"
if test ! "$(which yarn)"
then
        log "Yarn n'est pas installé, veuillez installer Yarn avant d'éxécuter ce script"
        exit
else log "Yarn => OK"
fi

## Mise à jour de NPM
log "Mise à jour de npm"
log "Version actuelle de npm : $(npm -v)"
#npm install -g npm@latest >/dev/null 2>&1
log "Nouvelle version de npm : $(npm -v)"

## Installation du gestionnaire de version de Node.js
#log "Installation de n,  gestionnaire de version de Node.js"
#npm install -g n >/dev/null 2>&1
#log "Vérification de l'installation de n"
#if test ! "$(n --version)"
#then
#       log "n n'est pas correctement installé."
#       exit
#else log "n => OK"
#fi

## Liste les packages installés : npm list -g --depth=0
## Installation des packages global
yarn global add yo
yarn global add express
yarn global add webpack
yarn global add mjml
yarn global add bower
yarn global add gulp
yarn global add grunt

## Ajout du chemin d'installation global des packages yarn

# Spécifique à windows.
#set PATH=%PATH%;%USERPROFILE%\AppData\Local\Yarn\config\global\node_modules\.bin

## Vérification de l'installation d'Atom
log "Vérification de l'installation d'Atom"
if test ! "$(which apm)"
then
        log "Atom n'est pas installé, la configuration des options et l'installation des packages n'aura pas lieux."
else
        ## Configuration d'Atom

        ## Installation des packages Atom
        # Raccourci pour l'edition de page HTML
        log "Installation du package Emmet pour Atom"
        apm install emmet >/dev/null 2>&1
        # Genérateur de bloc de commentaire
        log "Installation du package docblockr pour Atom"
        apm install docblockr >/dev/null 2>&1
        # Ajoute des icons au nom de fichier dans Atom
        log "Installation du package file-icons pour Atom"
        apm install file-icons >/dev/null 2>&1
        # Aide sur la synthax et les erreurs pour le code javascript
        log "Installation du package linter pour Atom"
        apm install linter >/dev/null 2>&1
        # Affiche une mini map du fichier en cours d'édition
        log "Installation du package minimap pour Atom"
        apm install minimap >/dev/null 2>&1
fi
