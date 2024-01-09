FROM debian
RUN apt update && apt install -y apache2 php

COPY index.php /var/www/html/
RUN chmod 755 /var/www/html/index.php && \
    rm -f /var/www/html/index.html
    
EXPOSE 80
ENTRYPOINT apachectl -D FOREGROUND