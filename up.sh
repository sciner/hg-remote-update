cd /var/www/$1 && hg revert --all && hg pull https://$3:$4@$2 && hg update
exit
