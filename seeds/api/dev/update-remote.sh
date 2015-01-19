#!/bin/sh
#TODO encapsulate variance
rsync -rtlvazPC --delete-after --force --stats . -e "ssh -p 4444" root@choupinette:/root/portal/seeds/api/