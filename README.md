Self-hosting configuration
==========================

## Production

1. Import dependencies

    ```
    git submodule update --init --recursive
    ```

2. Edit environment variables

    ```
    vim prod.env
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
    ./docker-compose-env.sh -f docker-compose.yml -f docker-compose.prod.yml up
    ```

## Development

1. Import dependencies

    ```
    git submodule update --init --recursive
    ```

2. Create the required directories and files

    ```
    mkdir -p nginx-proxy/nginx-proxy-files/{certs,conf.d,dhparam}
    touch prod.env
    ```

3. Create self-signed certificate

    ```
    openssl req -nodes -x509 -newkey rsa:1024 -keyout nginx-proxy/nginx-proxy-files/certs/localhost.key -out nginx-proxy/nginx-proxy-files/certs/localhost.crt && openssl dhparam -out nginx-proxy/nginx-proxy-files/dhparam/dhparam.pem 1024
    ```

4. Generate `keeweb-webdav/user.passwd`

    You may need to install `apache2-utils`

    ```
    apt install apache2-utils
    ```

    ```
    htpasswd -c -B "keeweb-webdav/user.passwd" <user>
    ```

5. Run docker-compose

    ```
    ./docker-compose-env.sh up --force-recreate --build
    ```

    Note: You may need to change the `DCP_ENV_HOST_IP_ADDR` value in `.env` to match your own Docker configuration.

6. Reach any of the defined URLs
    - http://git.localhost or https://git.localhost
    - http://netdata.localhost or https://netdata.localhost
    - http://keeweb.localhost or https://keeweb.localhost
    - etc.
