Self-hosting configuration
==========================

1. Create self-signed certificate

    ```
    mkdir -p nginx-proxy/nginx-proxy-files/certs
    openssl req -nodes -x509 -newkey rsa:4096 -keyout nginx-proxy/nginx-proxy-files/certs/localhost.key -out nginx-proxy/nginx-proxy-files/certs/localhost.crt -days 365
    ```

2. Edit environment variables

    ```
    cp .env.template .env
    vim .env
    ```

3. Generate `keeweb-webdav/user.passwd`

    You may need to install `apache2-utils`

    ```
    apt install apache2-utils
    ```

    ```
    htdigest -c "keeweb-webdav/user.passwd" keeweb-webdav morgan
    ```

4. Run docker-compose

    ```
    docker-compose up
    ```
