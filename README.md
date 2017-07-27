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
    htdigest -c "keeweb-webdav/user.passwd" keeweb-webdav morgan
    ```

3. Run docker-compose

    ```
    ./docker-compose-env.sh -f docker-compose.yml -f docker-compose.prod.yml up
    ```

## Development

1. Create self-signed certificate

    ```
    mkdir -p nginx-proxy/nginx-proxy-files/certs
    openssl req -nodes -x509 -newkey rsa:4096 -keyout nginx-proxy/nginx-proxy-files/certs/localhost.key -out nginx-proxy/nginx-proxy-files/certs/localhost.crt -days 365
    ```

2. Generate `keeweb-webdav/user.passwd`

    You may need to install `apache2-utils`

    ```
    apt install apache2-utils
    ```

    ```
    htdigest -c "keeweb-webdav/user.passwd" keeweb-webdav morgan
    ```

3. Run docker-compose

    ```
    ./docker-compose-env.sh up
    ```
