#!/bin/sh
echo -ne '\033c\033]0;T3-Jeu\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Cluetsu.x86_64" "$@"
