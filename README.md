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

1. Create the required directories and files

    ```
    mkdir -p traefik/certs
    touch prod.env traefik/acme.json
    ```

2. Create self-signed certificate

    ```
    openssl req -nodes -x509 -newkey rsa:1024 -keyout traefik/certs/localhost.key -out traefik/certs/localhost.crt
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

    Note: You may need to change the `DCP_ENV_HOST_IP_ADDR` value in `.env` to match your own Docker configuration.

5. Reach any of the defined URLs
    - http://git.localhost or https://git.localhost
    - http://netdata.localhost or https://netdata.localhost
    - http://keeweb.localhost or https://keeweb.localhost
    - etc.
