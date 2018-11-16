#!/bin/bash
set -x

mkdir peda

# Update gdb to gdb-peda
git clone https://github.com/longld/peda.git peda
echo "source ~/peda/peda.py" >> ~/.gdbinit
