## Automatically create custom domains (NOTE: Separated by a space and NOT a comma)
DOMAINS=("local.myorder.ndtec.co.za")

## Loop through all sites
for ((i=0; i < ${#DOMAINS[@]}; i++)); do

    DOMAIN=${DOMAINS[$i]}

    echo "Creating directory for $DOMAIN..."
    mkdir -p /var/www/$DOMAIN/public

    echo "Creating vhost config for $DOMAIN..."
    sudo cp /etc/apache2/sites-available/scotchbox.local.conf /etc/apache2/sites-available/$DOMAIN.conf

    echo "Updating vhost config for $DOMAIN..."
    sudo sed -i s,scotchbox.local,$DOMAIN,g /etc/apache2/sites-available/$DOMAIN.conf
    sudo sed -i s,/var/www/public,/var/www/$DOMAIN/public,g /etc/apache2/sites-available/$DOMAIN.conf

    echo "Enabling $DOMAIN. Will probably need to restart Apache..."
    sudo a2ensite $DOMAIN.conf

    echo "Let's restart Apache anyway..."
    sudo service apache2 restart

done