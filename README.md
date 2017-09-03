Self-hosting configuration
==========================

## Production

1. Edit environment variables

    ```
    vim prod.env
    ```

2. Generate `keeweb-webdav/user.passwd`

    You may need to install `apache2-utils`

    ```
    apt install apache2-utils
    ```

    ```
    htpasswd -c -B "keeweb-webdav/user.passwd" <user>
    ```

3. Configure the mail server

    ```
    docker run --rm \
      -e MAIL_USER=user1@domain.tld \
      -e MAIL_PASS=mypassword \
      -ti tvial/docker-mailserver:latest \
      /bin/sh -c 'echo "$MAIL_USER|$(doveadm pw -s SHA512-CRYPT -u $MAIL_USER -p $MAIL_PASS)"' >> mailserver/config/postfix-accounts.cf
    ```

4. Run docker-compose

    ```
    ./docker-compose-env.sh -f docker-compose.yml -f docker-compose.prod.yml up
    ```

## Development

1. Create the required directories

    ```
    mkdir -p nginx-proxy/nginx-proxy-files/{certs,conf.d,dhparam}
    ```

2. Create self-signed certificate

    ```
    openssl req -nodes -x509 -newkey rsa:1024 -keyout nginx-proxy/nginx-proxy-files/certs/localhost.key -out nginx-proxy/nginx-proxy-files/certs/localhost.crt && openssl dhparam -out nginx-proxy/nginx-proxy-files/dhparam/dhparam.pem 1024
    ```

3. Generate `keeweb-webdav/user.passwd`

    You may need to install `apache2-utils`

    ```
    apt install apache2-utils
    ```

    ```
    htpasswd -c -B "keeweb-webdav/user.passwd" <user>
    ```

4. Run docker-compose

    ```
    ./docker-compose-env.sh up --force-recreate --build
    ```
