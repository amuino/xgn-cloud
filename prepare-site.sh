sh -c 'echo "<VirtualHost *:80>                                        \n\
    ServerAdmin amuino@1uptalent.com                                   \n\
    ServerName xgn.1uptalent.com                                       \n\
    RailsEnv production                                                \n\
    DocumentRoot /home/ubuntu/production/current/public                \n\
    <Directory /home/ubuntu/production/current/public>                 \n\
        Allow from all                                                 \n\
        Options -MultiViews                                            \n\
    </Directory>                                                       \n\
    ErrorLog /var/log/apache2/production-error.log                     \n\
                                                                       \n\
    # Possible values include: debug, info, notice, warn, error, crit, \n\
    # alert, emerg.                                                    \n\
    LogLevel warn                                                      \n\
                                                                       \n\
    CustomLog /var/log/apache2/production-access.log combined          \n\
</VirtualHost>\n" > /etc/apache2/sites-available/xgn'

a2ensite xgn
