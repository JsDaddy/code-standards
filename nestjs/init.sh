#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "postgres" --dbname "postgres" <<-EOSQL
    CREATE DATABASE nestjs;
    USE nestjs;
    create user nestjsexample with encrypted password 'mypass';
    grant all on database nestjs to nestjsexample;
EOSQL