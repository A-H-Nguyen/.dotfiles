#!/bin/sh

venv_path="$(pwd)/.venv"

echo "venv???"

if [ -x "$venv_path" ] ; then
    echo "It's here: $venv_path"
else
    echo "Nothing ever happens"
fi

