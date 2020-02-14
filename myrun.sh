#!/bin/bash

#
# Run this with wget -qO- https://raw.githubusercontent.com/boschpeter/theotheu/master/myrun.sh | bash
#

git clone https://github.com/boschpeter/theotheu provisioning

cd provisioning

echo "Here I am `pwd`"

echo "localhost" >> hosts

ansible-playbook -i hosts site.yml
