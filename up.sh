cd /var/www/$1 && hg revert --all && hg pull https://$3:$4@$5$2 && hg update
exit
