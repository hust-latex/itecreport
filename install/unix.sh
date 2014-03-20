#!/usr/bin/env bash
# LaTeX package install script
# Author: Xu Cheng

command_exists () {
    type "$1" &> /dev/null ;
}

if ! command_exists realpath ; then
    if command_exists grealpath ; then
        realpath() {
            grealpath "$1"
        }
    else
        realpath() {
            [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
        }
    fi
fi

SCRIPT_PATH=$(realpath $(cd $(dirname $0);pwd))
cd $SCRIPT_PATH/..

TEXMFLOCAL=`kpsewhich --var-value=TEXMFLOCAL | awk -v RS="" -v FS="[\r\n]" '{print $1}' `

install(){
echo "Install itecreport-zh.cls and itecreport-en.cls template into local."
mkdir -p "${TEXMFLOCAL}/tex/latex/itecreport/"
cp -f ./itecreport/itecreport-zh.cls "${TEXMFLOCAL}/tex/latex/itecreport/"
cp -f ./itecreport/itecreport-en.cls "${TEXMFLOCAL}/tex/latex/itecreport/"
mkdir -p "${TEXMFLOCAL}/doc/latex/itecreport/"
cp -f ./itecreport/itecreport.pdf "${TEXMFLOCAL}/doc/latex/itecreport/"
cp -f ./itecreport/README.md "${TEXMFLOCAL}/doc/latex/itecreport/"
mkdir -p "${TEXMFLOCAL}/doc/latex/itecreport/example/"
cp -f ./itecreport/itecreport-zh-example.pdf "${TEXMFLOCAL}/doc/latex/itecreport/example/"
cp -f ./itecreport/itecreport-zh-example.tex "${TEXMFLOCAL}/doc/latex/itecreport/example/"
cp -f ./itecreport/itecreport-en-example.pdf "${TEXMFLOCAL}/doc/latex/itecreport/example/"
cp -f ./itecreport/itecreport-en-example.tex "${TEXMFLOCAL}/doc/latex/itecreport/example/"
cp -f ./itecreport/fig-example.pdf "${TEXMFLOCAL}/doc/latex/itecreport/example/"
cp -f ./itecreport/ref-example.bib "${TEXMFLOCAL}/doc/latex/itecreport/example/"
hash
}

uninstall(){
echo "Uninstall itecreport-zh.cls and itecreport-en.cls template."
rm -rf "${TEXMFLOCAL}/tex/latex/itecreport/"
rm -rf "${TEXMFLOCAL}/doc/latex/itecreport/"
hash
}

hash(){
echo "Refresh TeX hash database."
texhash
}

help(){
echo "Usage:"
echo " $(basename $0) install          - install itecreport-zh.cls and itecreport-en.cls template into local."
echo " $(basename $0) uninstall        - uninstall itecreport-zh.cls and itecreport-en.cls template."
echo ""
}

if [[ $1 = "install" ]]; then
    install
elif [[ $1 = "uninstall" ]]; then
    uninstall
else
    help
fi
