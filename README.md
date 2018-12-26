Self-hosting configuration
==========================

## Production

1. Edit environment variables

    ```
    cp prod.env.template prod.env && vim prod.env
    ```

2. Create the required directories and files

    ```
    touch prod.env traefik/acme.json && chmod 600 traefik/acme.json
    ```

3. Run docker-compose

    ```
    ./docker-compose-env.sh -f docker-compose.yml -f docker-compose.prod.yml up
    ```

## Development

1. Create the required directories and files

    ```
    touch prod.env traefik/acme.json && chmod 600 traefik/acme.json
    ```

2. Run docker-compose

    ```
    ./docker-compose-env.sh up --force-recreate --build
    ```

    Note: You may need to change the `DCP_ENV_HOST_IP_ADDR` value in `.env` to match your own Docker configuration.

3. Reach any of the defined URLs
    - http://git.localhost or https://git.localhost
    - http://netdata.localhost or https://netdata.localhost
    - http://keeweb.localhost or https://keeweb.localhost
    - etc.
