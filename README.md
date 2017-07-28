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

3. Run docker-compose

    ```
    ./docker-compose-env.sh -f docker-compose.yml -f docker-compose.prod.yml up
    ```

## Development

1. Create self-signed certificate

    ```
    mkdir -p nginx-proxy/nginx-proxy-files/certs
    openssl req -nodes -x509 -newkey rsa:4096 -keyout nginx-proxy/nginx-proxy-files/certs/localhost.key -out nginx-proxy/nginx-proxy-files/certs/localhost.crt
    ```

2. Generate `keeweb-webdav/user.passwd`

    You may need to install `apache2-utils`

    ```
    apt install apache2-utils
    ```

    ```
    htpasswd -c -B "keeweb-webdav/user.passwd" <user>
    ```

3. Run docker-compose

    ```
    ./docker-compose-env.sh up
    ```
