#/bin/sh
rsync -rtlvazPC --delete-after --force --stats . -e "ssh -p 2222" root@choupinette:~/portal/sources/html/