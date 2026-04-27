#!/bin/bash

/opt/mssql/bin/sqlservr &
sleep 30

./health_check.sh