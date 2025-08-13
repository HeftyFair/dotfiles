#!/bin/sh


HOST=$1

rsync -avz ~/.config/nvim "$HOST":~/.config/nvim