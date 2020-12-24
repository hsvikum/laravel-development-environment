#!/bin/bash

/usr/bin/code-server --bind-addr 0.0.0.0:8083 --user-data-dir /var/lib/code-server --auth password --cert
php-fpm