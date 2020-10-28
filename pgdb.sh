#!/usr/bin/env bash


docker run -d --name pg_db -p 5432:5432 -e POSTGRES_PASSWORD=yup postgres:12
