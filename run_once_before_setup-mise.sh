#!/bin/bash

if ! command -v fish >/dev/null; then
  echo "Please install the fish shell before setting up chezmoi"
  exit 1
fi

#setup mise
curl https://mise.run | sh
