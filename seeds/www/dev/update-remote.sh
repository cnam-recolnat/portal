#!/bin/sh
#TODO encapsulate variance
rsync -rtlvazPC --delete-after --force --stats . -e "ssh -p 2222" root@choupinette:/root/portal/seeds/www/