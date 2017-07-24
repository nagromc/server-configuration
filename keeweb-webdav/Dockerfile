FROM httpd:alpine

RUN sed -i 's|^#\(LoadModule auth_digest_module \)|\1|g' /usr/local/apache2/conf/httpd.conf && \
    sed -i 's|^#\(LoadModule dav_module \)|\1|g' /usr/local/apache2/conf/httpd.conf && \
    sed -i 's|^#\(LoadModule dav_fs_module \)|\1|g' /usr/local/apache2/conf/httpd.conf && \
    sed -i 's|^#\(LoadModule dav_lock_module \)|\1|g' /usr/local/apache2/conf/httpd.conf && \
    sed -i 's|^#\(Include conf/extra/httpd-dav\.conf\)|\1|g' /usr/local/apache2/conf/httpd.conf && \
    # mkdir -p /usr/local/apache2/var && \
    # chown daemon:daemon /usr/local/apache2/var
    mkdir -p /var/run/lock/apache2 && \
    chown daemon:daemon /var/run/lock/apache2 && \
    mkdir -p /var/www && \
    chown daemon:daemon /var/www
