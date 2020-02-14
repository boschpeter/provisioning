#!/bin/bash

git clone https://github.com/boschpeter/theotheu

echo "localhost" >> hosts

ansible-playbook -i hosts site.yml
