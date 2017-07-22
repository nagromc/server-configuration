Self-hosting configuration
==========================

1. Create self-signed certificate

    ```
    openssl req -nodes -x509 -newkey rsa:4096 -keyout certs/localhost.key -out certs/localhost.crt -days 365
    ```

2. Run docker-conpose

    ```
    docker-compose up
    ```
