#!/bin/bash

#
# Run this with wget -qO- https://raw.githubusercontent.com/boschpeter/theotheu/master/myrun.sh | bash
#

git clone https://github.com/boschpeter/theotheu

echo "localhost" >> hosts

ansible-playbook -i hosts site.yml
