#!/bin/bash

# mise.conf hash: {{ include "private_dot_config/mise/config.toml" | sha256sum }}

export PATH=$PATH:~/.local/bin

mise install
